# ltc_mtc
FPGA-based conversion between linear time code and MIDI time code.
The current code generates linear time code and encodes it as both SMPTE 12 and MIDI Time Code.
It receives and decodes analog LTC from a source.
It receives and decodes MIDI Time Code from a MIDI master.
Any of the three sources (internal generator, received LTC, received MTC) can drive the eight-digit display.

To do:

1. Allow a choice of the LTC output from either internal generator, received LTC or received MTC.
2. Allow a choice of the MTC output from either internal generator, received LTC or received MTC.
3. Use LEDs to indicate received MTC and LTC frame rates and receive status (signal present).


## Linear Time Code Generation Overview.
My primary reference for implementing linear time code is [this Wikipedia page](https://en.wikipedia.org/wiki/Linear_timecode).

Linear time code is an audio signal that is encoded according to SMPTE 12M. It is an 80-bit packet of digital data carrying a time-of-day in hours, minutes, seconds and frames. Also included in the packet are eight four-bit user fields, a few flags, and a fixed-pattern 16-bit synchronize word.

Packets are sent at a given frame rate. There are a few standard frame rates: 24 fps, 25 fps, 30 fps as well as a "drop frame" rate of 29.97 fps. (Code here as of this writing does not support the drop frame format.) The packet is sent out least-significant bit first, using biphase mark coding. That coding is trivial: there is a transition (change of state) at the start of every bit period. A '1' bit has an additional transition in the middle of the bit.

Given a frame rate, we can easily determine the bit rate:

$$bitrate = framerate * 80$$

For 30 fps, the frame rate is 2400 bits per second, so the time per bit is $1 / bitrate = 416.667 &mu;s$.

A simple counter is used to create the bit time. When the counter rolls over, the the output signal toggles. Half a bit time later there will be a second toggle if the bit is a '1'. 

A frame rate timer asserts a strobe once every frame time. This timer is derived from a continuously-running higher-frequency FPGA clock. The timer reload value is set such that the timer rolls over at the desired frame rate.

## The Time Code Timer
Given a selected frame rate, the FPGA generates a timecode record. This is done in [timecode_generator.vhdl](https://github.com/aspdigital/ltc_mtc/blob/main/src/timecode_generator.vhdl). The current frame time is maintained in a signal `frame_time` of the following record type:

```    
    type frame_time_t is record
        -- frame range is max 29
        frame_cnt  : frame_cnt_t;
        -- seconds range from 0 to 59
        ft_sec     : time_0_to_59_t;
        -- minutes range from 0 to 59
        ft_min     : time_0_to_59_t;
        -- hours range from 0 to 23
        ft_hr      : time_0_to_23_t;
    end record frame_time_t;
```
where the four members of the record are essentially pairs of Binary Coded Decimal digits. They are maintained as BCD to simplify both display on the 7-segment digits as well as when they are encoded into SMPTE LTC which wants BCD. Doing this means we don't have to do a divide-by-ten to convert from binary into decimal digits.

The generator has a `frame_tick` signal as an input. This is at the frame rate. On each tick, the `frame_cnt` is incremented, and when it overflows (at 24, 25 or 30) the seconds increment, and so forth.

The generated `frame_time` is presented to the MTC encoder, the LTC encoder and the display driver logic.

## Linear Time Code Encoding
The `frame_time` record and the `frame_tick` strobe are presented to the Linear Time Code encoder [ltc_encoder.vhdl](https://github.com/aspdigital/ltc_mtc/blob/main/src/ltc_encoder.vhdl). On `frame_tick` the `frame_time` is loaded into an 80-bit shift register, with the required flags and user fields interspersed. (Flags and user fields are cleared to '0' for now.) 

Conveniently, the fields in the time code frame are BCD, so our frame time record maps directly to the initial contents of the shift register. 

A `bit_timer` generates the time for each bit to go out and the shift register shifts when the timer expires. The LSb of the shift register  shifts into `prev_bit`. At the start of a bit time there is a transition on the encoded output signal as required by the biphase mark encoding. In the middle of the bit time, if the bit being encoded is a `'1'` there is a second transition on the encoded output signal.

The serial bit output of the LTC encoder goes out of the FPGA on the Nexsys board's AUD_PWM pin. This pin connects to an analog filter that provides level shifting and AC coupling and buffering, and this drives the 1/8" audio jack J8.

## MIDI Time Code Generation
Details for MIDI Time Code can be found in the [official spec](https://midi.org/midi-time-code).

The logic that generates the `frame_time` drives that signal to the [mtc_encoder.vhdl](https://github.com/aspdigital/ltc_mtc/blob/main/src/mtc_encoder.vhdl) along with the `frame_tick`. This indicates the start of a frame.

MIDI Time Code is sent as a sequence of Quarter Frame messages. Quarter Frame messages are two-byte messages sent, as should be clear from the name, four times a frame. They are sent in this order: frame count LSN, frame count MSN, seconds LSN, seconds MSN, minutes LSN, minutes MSN, hours LSN, hours MSN and frame rate.

There are eight messages in all, so to send the complete current time requires two frames. The receiver is responsible for keeping track. The spec itself notes that when the last Quarter Frame message is received so the time can be fully assembled, that information is actually two frames old. The receiver should keep an internal offset of +2 frames for its internal use and for display.

The frame tick synchronizes the state machine that sends the messages. The clever thing is that the frame tick generator (in `frame_timer.vhd`) outputs a quarter-frame tick packet as well, and that packet includes the quarter-tick identifier which ranges from 0 to 7. The encoder simply uses that to know which Quarter Frame message to send.

Note that unlike linear time code, MIDI time code uses straight binary coding for the time (frame, seconds, etc). This means that we must convert our linear time count from BCD to binary. This requires a multiply to convert the tens digit, but multipliers are cheap in Artix-7. The overloaded functions `BCDToSLV()` in `ltc_mtc_pkg.vhd` implement that conversion, and they return std_logic_vector for ease in creating the required message nybble.

The MIDI time code is output on the PMOD connector JA pin 2. There is unfortunately no MIDI I/O PMOD, so this pin needs to drive the proper MIDI Out circuit.

## Linear Time Code Decoding
### LTC Input
SMPTE time code is an analog signal at an audio frequency. We can expect it to be AC coupled and its amplitude compatible with standard analog rails. But it is also a digital signal, as its level is really just one of two states (levels). We don't much care about the amplitude. We are interested in the transitions at the start and possibly the middle of a bit. This means we have some options about how to get the signal into our FPGA.

1. Analog comparator such as LM339. This old friend would seem to be the easiest option, as it can manage the level shifting (accept any input voltage up to its supply rail, which can exceed the FPGA rail) and pulling the output open collector to the FPGA bank rail ensures compatibility with the FPGA input. The required circuit could be built up on a Digilent [PMOD BB](https://digilent.com/shop/pmod-bb-wire-wrap-breadboard/).
2. Use a channel of the Xilinx ADC. This, like the comparator option, requires analog signal conditioning to ensure that the input signal fits into the allowable range.
3. Use a standard audio ADC. I had a [PMOD I2S2](https://digilent.com/shop/pmod-i2s2-stereo-audio-input-and-output/) lying around. This module has separate audio ADC and DAC, each of which provides its own I2S interface. The ADC has rudimentary input signal conditioning, and audio quality isn't terribly important in this application. This is the option I chose.

### Receiving LTC with an ADC
#### The ADC
The PMOD's ADC is the [Cirrus CS5343](https://www.cirrus.com/products/cs5343-44/) (listed as obsolete, but who cares, we are not designing a product around it), which is the standard sort of 24-bit ADC with I2S interface, with sample rate up to 108 kHz. The device can be either an I2S master (it generates SCLK and LRCLK from the incoming MCLK) or an I2S slave (an external master, in this case our FPGA, creates and drives the SCLK and LRCLK to the converter). This design uses the ADC in the slave configuration so our FPGA generates the I2S clocks (in the [clks_rst.vhdl](https://github.com/aspdigital/ltc_mtc/blob/main/src/clks_rst.vhdl) entity).
#### What sample rate?
An obvious question: What audio sample rate should be used? Since this is not a typical audio converter application that must provide the "standard" sample rates (44.1 kHz, 48 kHz and their multiples), we can choose anything that makes sense, taking into account that our converter supports sample rates up to 108 kHz. So why not make our life as easy as possible? 

Decoding LTC means looking at bit edges and when they occur. Remember that a '0' is encoded with one transition per bit time, and a '1' is encoded with two transitions per bit time. This means we need to determine the bit time by looking at transitions. Bit time granularity is set by the sample rate, and it's nice to have a round number for it. Our converter supports a 100 kHz sample rate, which is a 10 µs interval.

Further, we know the expected bit times based on the frame rate, and we have only three frame rates: 24 fps, 25 fps and 30 fps. Given the 80 bit frame, the bit time for 24 fps is 1/1920 or 520.8 µs. The bit time for 30 fps is 1/2400 or 416.6667 µs. While these are not integers, we have enough resolution to easily detect the bit time and hence the frame rate.
#### MMCM to generate the MCLK that makes our sample rate possible
The CS5343 converter supports a 100 kHz sample rate at several different oversampling ratios: 128x, 192x, 256x and 384x. The modulator clock is synthesized by an MMCM from the 100 MHz oscillator input. I played with the Clock Wizard to see if it would give me a 12.8 MHz, 19.2 MHz, 25.6 MHz or 38.4 MHz output from our 100 MHz, and whether I could use the existing MMCM or whether another was necessary. It turns out that I needed an MMCM for the audio clock generation that's separate from the LTC generator clocking (see below) because I couldn't get the rates I wanted. One can generate 38.4 MHz from 100 MHz in the MMCM without trouble as long as we don't try to generate other frequencies, so that is the clock rate chosen. SCLK and LRCLK are generated from the MCLK with counters in the usual way. The decoder process runs on the 38.4 MHz clk_audio.
### Decoding LTC from audio samples
Timecode is a simple digital signal. In the analog audio domain, it looks like a square wave between a positive level and a negative level, and if we are AC coupled (we should be) the positive and negative levels are the same. The edges of the bits are indicated by a transition between the positive and negative levels. Our converter gives us 2's-complement samples. The clever part is that even though we are using a 24-bit converter, we do not care about the absolute voltage levels. All we care about is that the signal either was positive on the previous sample and is now negative, or the converse. This makes it possible to decode the signal by simply look at each sample's sign bit (the MSb) and when it changes, that's our transition, which we can use to decode the incoming time code frame.
### Decoding LTC from transitions
*The following works on transitions, whether they are from the MSb of an audio sample or from a comparator.*

We need to determine the width of the bits we are receiving. This is for two reasons. One, we need to be able to distinguish between a '0' which is where there is only one transition per bit time and a '1' which is where there is a second transition in the middle of the bit time. Two, the bit size tells us the frame rate.

After reset or when the time code signal starts to arrive, we try to determine the size of a bit. The biphase mark coding forces a transition on the signal at least once per bit time. We wait for a transition then start a timer. When there is another transition, we capture the timer value and use it to look up the frame rate. That timer value should be one of only six possible (for 24, 25 or 30 fps and either the '1' or '0' bit) values.

Now we have our frame time and we know the width of each bit, and we can start decoding. We set a "time code receiver locked" flag for the outside world if it cares. From our frame time we also have a "3/4 bit time" timer value. This is how we determine whether each transition marks the start of a bit or the middle of a bit. Before we start decoding, we need to find the start of a bit:

1. Wait for a transition, then load a downcounter timer with the 3/4 bit time. 
2. The timer immediately starts. Look for the next transition.
3. Inspect the timer value on the next transition. Remember that we are counting 3/4 bit time. If the counter is non-zero, then the transition we just saw is the middle bit transition (indicating a '1' was transmitted). Wait until the next transition: it will be for the start of a bit.
4. If the counter is zero, our transition indicated the start of a bit. Now we know where bits start.

Once we know where bits start, we can decode. At a bit start, load the downcounter timer with the 3/4 bit time, and on the next transition, inspect the counter. If the counter is zero, we are at the start of the next bit time, so we found a '0', which we shift in to an 80-bit shift register. If the counter is not zero, we found a '1', which we shift into that shift register. Then we wait until the next transition which is the start of a bit, and repeat.

As we are shifting in each bit, look for the sync pattern in the shift register's 16 MSbs. When we see it, we have shifted in an entire time code frame. Latch the BCDs from the shift register into the frame time record and strobe the "got new frame time" signal to tell the outside world that we have a new time.

Continue shifting as long as we get new transitions.
### Loss-of-signal and frame rate change.
It is reasonable to expect that the time code generator might change frame rate or stop entirely. We must continually monitor the transitions for such possibilities, and gracefully handle restarting if the time code comes back.
#### Loss of signal monitor
Independent of the above timers, we have a loss-of-signal monitor. This monitor is a long timer that can count over several bits, as well as some test logic. It is a basic watchdog.

On every transition, we "pet the dog" by reloading the monitor timer. If we don't see transitions, eventually the monitor timer reaches 0, and this condition indicates loss of signal. Losing signal will put the state machines that determine bit width and do the decoding into reset until we start to see signal again. This ensures that the proper frame rate is established.
#### Frame rate changes
After the bit width is determined, that machine will settle into a frame rate monitor. Every transition restarts the bit width timer and also checks if the previous timer count is different from what we expect given our current frame rate. If the frame rate has changed, then we simply update the 3/4-bit-time value and also the frame rate output, and then continue decoding as we were. The current frame time might be incorrect but it will be corrected by the next frame. 

## MIDI Time Code Decoding
A MIDI time code generator creates four quarter-frame messages per frame on a regular interval. The message includes a status byte indicating which time code nybble is carried in the message. As noted elsewhere, there are eight nybbles required to get a complete frame time, so it takes eight messages or two frames to fully determine the time.

As each message comes in, we decode it and store the provided nybble. After either the zeroth message (which has the frame count LSN) or the fourth message (which has the minutes LSN) we output a "new frame time" strobe along with the current frame time. Since the fourth messages is in between frames, we take the previous frame time and increment it (first frame count, then seconds, then minutes, then hours) to ensure that we always have the correct frame count incrementing by 1, not 2. 

## Clocking

The main FPGA clock is divided down to get a strobe at the frame rate (and further divided to get the bit rate). There is a complication. Ideally we want the frame rate timer and also the bit period timer to be evenly divisible from the main FPGA clock. If it's not, the resulting time will be off. 

Calculating the number of ticks of the main clock to get the frame rate is easy:

$$numticks = frametime / clkperiod$$ 

For example, given a 100 MHz clock, we have a 10 ns clock period. How many ticks of our 100 MHz clock are needed to count a 24 fps frame rate?

$$numticks = (1 / 24) / 10 ns = 4,166,666.667$$

And right away see that's not evenly divisible. Nor is 30 fps from that same clock. Obviously this won't work.

One way to handle this situation is to use a phase-locked loop to synthesize a higher-frequency clock from the incoming time code signal. If done externally, this adds parts, and we have a fancy FPGA, so we reject this idea. All modern FPGAs, like the Artix-7 used in this demonstration, have well-featured clock management blocks. The MMCM in the Artix-7 has phase-locked loops, too. But they aren't intended to be used with such a low-frequency reference clock (again, 30 fps is a bit rate, with a guaranteed toggle rate, of only 2400 Hz). That won't work, either.

MMCMs are very flexible and have multiple (in Artix-7, six) clock outputs. A bit of experimenting with the Xilinx Vivado Clock Wizard showed that we can generate, from the board's 100 MHz reference clock input, three clocks, each of which evenly divide dowm to the three frame rates we support.

We want the timing for the frame rate divider and the time generator to see just one clock input, not three. Xilinx provides other clocking niceties, including the BUFGMUX primitive. This primitive is what it says on the tin: a mux with two clock inputs and a select input. But we have three clocks! Easy. Just use a mux to select between two of the clocks, and a second mux to select between that choice and the third clock. This is two bits of control and easily managed.

Constraints are important. We create one top-level clock constraint for our 100 MHz oscillator input:

`create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]`

and Vivado magically creates all of the downstream generated-clock constraints. That is, it knows how to timing the logic on the clock that comes out of the mux. We do have a bunch of false path constraints to sell Vivado not to try to time any interactions between any of these clocks.

The MMCM and mux logic is described in [clks_rst.vhdl](https://github.com/aspdigital/ltc_mtc/blob/main/src/clks_rst.vhdl).

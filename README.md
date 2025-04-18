# ltc_mtc
FPGA-based conversion between linear time code and MIDI time code.
The current code generates linear time code and encodes it as both SMPTE 12 and MIDI Time Code.
Other features will be added in future.

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

## MIDI Time Code Generation
Details for MIDI Time Code can be found in the [official spec](https://midi.org/midi-time-code).

The logic that generates the `frame_time` drives that signal to the [mtc_encoder.vhdl](https://github.com/aspdigital/ltc_mtc/blob/main/src/mtc_encoder.vhdl) along with the `frame_tick`. This indicates the start of a frame.

MIDI Time Code is sent as a sequence of Quarter Frame messages. Quarter Frame messages are two-byte messages sent, as should be clear from the name, four times a frame. They are sent in this order: frame count LSN, frame count MSN, seconds LSN, seconds MSN, minutes LSN, minutes MSN, hours LSN, hours MSN and frame rate.

There are eight messages in all, so to send the complete current time requires two frames. The receiver is responsible for keeping track. The spec itself notes that when the last Quarter Frame message is received so the time can be fully assembled, that information is actually two frames old. The receiver should keep an internal offset of +2 frames for its internal use and for display.

The frame tick synchronizes the state machine that sends the messages. The clever thing is that the frame tick generator (in `frame_timer.vhd`) outputs a quarter-frame tick packet as well, and that packet includes the quarter-tick identifier which ranges from 0 to 7. The encoder simply uses that to know which Quarter Frame message to send.

Note that unlike linear time code, MIDI time code uses straight binary coding for the time (frame, seconds, etc). This means that we must convert our linear time count from BCD to binary. This requires a multiply to convert the tens digit, but multipliers are cheap in Artix-7. The overloaded functions `BCDToSLV()` in `ltc_mtc_pkg.vhd` implement that conversion, and they return std_logic_vector for ease in creating the required message nybble.

## Linear Time Code Decoding

## MIDI Time Code Decoding

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

# ltc_mtc
FPGA-based conversion between linear time code and MIDI time code.
The current code is simply a linear time code generator.
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

The MMCM and mux logic is described in https://github.com/aspdigital/ltc_mtc/blob/main/src/clks_rst.vhdl

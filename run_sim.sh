#!/bin/bash
iverilog -o simv src/*.v tb/tb_top_secureboot.v
vvp simv
gtkwave wave.vcd &
 
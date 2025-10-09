#!/bin/bash
iverilog -o simv tb/tb_top_secureboot.v src/*.v
vvp simv
gtkwave dump.vcd &

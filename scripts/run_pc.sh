#!/bin/bash
set -e
echo "Compiling PC & TB"
OUT_DIR=sim/pc
mkdir -p $OUT_DIR
iverilog -g2012 -o $OUT_DIR/sim.out \
rtl/core/pc.sv \
tb/pc_tb.sv
echo "Running Simulation"
cd $OUT_DIR
vvp sim.out
cd - > /dev/null
echo "Complete"
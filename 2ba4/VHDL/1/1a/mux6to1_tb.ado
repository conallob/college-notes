-- Auto Generated by Project Navigator to simulate
-- HDL Bencher Annotated Test Bench
--
vlib work
onbreak {resume}
onerror {resume}
onElabError {resume}
vcom -just e -93 -explicit   -work work mux6to1.vhd
vcom -skip e -93 -explicit   -work work mux6to1.vhd
vcom -just e -93 -explicit   mux6to1_tb.ant
vcom -skip e -93 -explicit   mux6to1_tb.ant
vsim -t 1ps -L xilinxcorelib   -lib work testbench
run -all
quit -force

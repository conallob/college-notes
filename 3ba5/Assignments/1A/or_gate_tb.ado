source {C:/Xilinx/data/projnav/scripts/VsimStopServer.tcl}
initIPC 1200
-- Auto Generated by Project Navigator to simulate
-- HDL Bencher Annotated Test Bench
--
vlib work
onbreak {resume}
onerror {quit -code 99 -force}
onElabError {resume}
vcom -93 -explicit  or_inv_gate.vhd
vcom -93 -explicit  or_gate_tb.ant
vsim -t 1ps  -lib work or_gate_tb
run -all
quit -force

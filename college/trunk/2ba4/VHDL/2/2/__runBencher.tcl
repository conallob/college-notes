set TBWFile "splitter_9bit_tb.tbw"
if [file exists $TBWFile] { file delete -force $TBWFile }
set BencherCmdFile "_hb_cmds"
execVisible C:/Xilinx/bin/nt/tb.exe -f \"_hb_cmds\"

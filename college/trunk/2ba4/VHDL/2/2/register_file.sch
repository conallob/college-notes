VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "Virtex2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL XLXN_2(8:0)
        SIGNAL D_IN(3:0)
        SIGNAL CLK
        SIGNAL RESET
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15(15:0)
        SIGNAL XLXN_16(15:0)
        SIGNAL XLXN_17(15:0)
        SIGNAL XLXN_18(15:0)
        SIGNAL XLXN_19(15:0)
        SIGNAL XLXN_20(15:0)
        SIGNAL XLXN_21(15:0)
        SIGNAL XLXN_22(15:0)
        SIGNAL XLXN_23(15:0)
        SIGNAL XLXN_24(15:0)
        SIGNAL Sel_A(3:0)
        SIGNAL Sel_B(3:0)
        SIGNAL A(15:0)
        SIGNAL B(15:0)
        PORT Input D_IN(3:0)
        PORT Input CLK
        PORT Input RESET
        PORT Input Sel_B(3:0)
        PORT Input Sel_A(3:0)
        PORT Output A(15:0)
        PORT Output B(15:0)
        BEGIN BLOCKDEF reg_16bit
            TIMESTAMP 2004 5 12 15 16 0
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF splitter_9bit
            TIMESTAMP 2004 5 12 15 19 56
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            RECTANGLE N 0 -556 64 -532 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF mux_9to1_16bit
            TIMESTAMP 2004 5 11 18 43 32
            RECTANGLE N 64 -640 320 0 
            LINE N 64 -608 0 -608 
            RECTANGLE N 0 -620 64 -596 
            LINE N 64 -544 0 -544 
            RECTANGLE N 0 -556 64 -532 
            LINE N 64 -480 0 -480 
            RECTANGLE N 0 -492 64 -468 
            LINE N 64 -416 0 -416 
            RECTANGLE N 0 -428 64 -404 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -364 64 -340 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -608 384 -608 
            RECTANGLE N 320 -620 384 -596 
        END BLOCKDEF
        BEGIN BLOCKDEF decoder
            TIMESTAMP 2004 5 12 15 35 48
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 reg_16bit
            PIN load XLXN_6
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_24(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 reg_16bit
            PIN load XLXN_7
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_23(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 reg_16bit
            PIN load XLXN_8
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_22(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 reg_16bit
            PIN load XLXN_9
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_21(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_6 reg_16bit
            PIN load XLXN_10
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_20(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_7 reg_16bit
            PIN load XLXN_11
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_19(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 reg_16bit
            PIN load XLXN_12
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_18(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 reg_16bit
            PIN load XLXN_13
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_17(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_10 reg_16bit
            PIN load XLXN_14
            PIN clk CLK
            PIN din
            PIN load_data(15:0) XLXN_15(15:0)
            PIN dout(15:0) XLXN_16(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_12 splitter_9bit
            PIN input(8:0) XLXN_2(8:0)
            PIN output0 XLXN_6
            PIN output1 XLXN_7
            PIN output2 XLXN_8
            PIN output3 XLXN_9
            PIN output4 XLXN_10
            PIN output5 XLXN_11
            PIN output6 XLXN_12
            PIN output7 XLXN_13
            PIN output8 XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_13 mux_9to1_16bit
            PIN SEL(3:0) Sel_B(3:0)
            PIN A(15:0) XLXN_24(15:0)
            PIN B(15:0) XLXN_23(15:0)
            PIN C(15:0) XLXN_22(15:0)
            PIN D(15:0) XLXN_21(15:0)
            PIN E(15:0) XLXN_20(15:0)
            PIN F(15:0) XLXN_19(15:0)
            PIN G(15:0) XLXN_18(15:0)
            PIN H(15:0) XLXN_17(15:0)
            PIN I(15:0) XLXN_16(15:0)
            PIN MUX_OUT(15:0) B(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_14 mux_9to1_16bit
            PIN SEL(3:0) Sel_A(3:0)
            PIN A(15:0) XLXN_24(15:0)
            PIN B(15:0) XLXN_23(15:0)
            PIN C(15:0) XLXN_22(15:0)
            PIN D(15:0) XLXN_21(15:0)
            PIN E(15:0) XLXN_20(15:0)
            PIN F(15:0) XLXN_19(15:0)
            PIN G(15:0) XLXN_18(15:0)
            PIN H(15:0) XLXN_17(15:0)
            PIN I(15:0) XLXN_16(15:0)
            PIN MUX_OUT(15:0) A(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_15 decoder
            PIN RESET RESET
            PIN CLK CLK
            PIN D_IN(3:0) D_IN(3:0)
            PIN D_OUT(8:0) XLXN_2(8:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_12 544 1568 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_13 2544 2112 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_14 2544 480 M180
        END INSTANCE
        BEGIN BRANCH XLXN_2(8:0)
            WIRE 464 784 464 816
            WIRE 464 816 464 1024
            WIRE 464 1024 528 1024
            WIRE 528 1024 544 1024
        END BRANCH
        BEGIN BRANCH D_IN(3:0)
            WIRE 336 160 336 384
            WIRE 336 384 336 400
            WIRE 336 384 336 432
        END BRANCH
        BEGIN BRANCH CLK
            WIRE 400 160 400 336
            WIRE 400 336 1392 336
            WIRE 1392 336 1536 336
            WIRE 1392 336 1392 592
            WIRE 1392 592 1536 592
            WIRE 1392 592 1392 848
            WIRE 1392 848 1536 848
            WIRE 1392 848 1392 1104
            WIRE 1392 1104 1536 1104
            WIRE 1392 1104 1392 1360
            WIRE 1392 1360 1536 1360
            WIRE 1392 1360 1392 1616
            WIRE 1392 1616 1536 1616
            WIRE 1392 1616 1392 1872
            WIRE 1392 1872 1536 1872
            WIRE 1392 1872 1392 2128
            WIRE 1392 2128 1536 2128
            WIRE 1392 2128 1392 2384
            WIRE 1392 2384 1536 2384
            WIRE 400 336 400 384
            WIRE 400 384 400 400
            WIRE 400 384 400 432
        END BRANCH
        BEGIN BRANCH RESET
            WIRE 464 160 464 384
            WIRE 464 384 464 400
            WIRE 464 384 464 432
        END BRANCH
        IOMARKER 336 160 D_IN(3:0)
        IOMARKER 400 160 CLK
        IOMARKER 464 160 RESET
        BEGIN BRANCH XLXN_6
            WIRE 928 1024 944 1024
            WIRE 944 272 944 1024
            WIRE 944 272 1536 272
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 928 1088 944 1088
            WIRE 944 1088 1232 1088
            WIRE 1232 528 1232 1088
            WIRE 1232 528 1536 528
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 928 1152 944 1152
            WIRE 944 1152 1248 1152
            WIRE 1248 784 1248 1152
            WIRE 1248 784 1536 784
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 928 1216 944 1216
            WIRE 944 1216 1264 1216
            WIRE 1264 1040 1264 1216
            WIRE 1264 1040 1536 1040
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 928 1280 944 1280
            WIRE 944 1280 944 1296
            WIRE 944 1296 1536 1296
        END BRANCH
        BEGIN BRANCH XLXN_11
            WIRE 928 1344 944 1344
            WIRE 944 1344 1232 1344
            WIRE 1232 1344 1232 1552
            WIRE 1232 1552 1536 1552
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 928 1408 944 1408
            WIRE 944 1408 1216 1408
            WIRE 1216 1408 1216 1808
            WIRE 1216 1808 1536 1808
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 928 1472 944 1472
            WIRE 944 1472 1200 1472
            WIRE 1200 1472 1200 2064
            WIRE 1200 2064 1536 2064
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 928 1536 944 1536
            WIRE 944 1536 944 2320
            WIRE 944 2320 1536 2320
        END BRANCH
        BEGIN BRANCH XLXN_15(15:0)
            WIRE 816 96 816 384
            WIRE 816 384 1104 384
            WIRE 1104 384 1104 640
            WIRE 1104 640 1312 640
            WIRE 1312 640 1312 720
            WIRE 1312 720 1536 720
            WIRE 1104 640 1104 976
            WIRE 1104 976 1536 976
            WIRE 1104 976 1104 1232
            WIRE 1104 1232 1536 1232
            WIRE 1104 1232 1104 1488
            WIRE 1104 1488 1536 1488
            WIRE 1104 1488 1104 1744
            WIRE 1104 1744 1536 1744
            WIRE 1104 1744 1104 2000
            WIRE 1104 2000 1536 2000
            WIRE 1104 2000 1104 2256
            WIRE 1104 2256 1536 2256
            WIRE 1104 2256 1104 2512
            WIRE 1104 2512 1536 2512
            WIRE 1104 384 1312 384
            WIRE 1312 384 1312 464
            WIRE 1312 464 1536 464
        END BRANCH
        BEGIN INSTANCE XLXI_1 1536 496 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 1536 752 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1536 1008 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1536 1264 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 1536 1520 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 1536 1776 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_8 1536 2032 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_9 1536 2288 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_10 1536 2544 R0
        END INSTANCE
        BEGIN BRANCH XLXN_16(15:0)
            WIRE 1920 2320 2224 2320
            WIRE 2160 512 2160 2080
            WIRE 2160 2080 2224 2080
            WIRE 2224 2080 2224 2320
            WIRE 2224 2080 2544 2080
            WIRE 2160 512 2544 512
        END BRANCH
        BEGIN BRANCH XLXN_17(15:0)
            WIRE 1920 2064 2224 2064
            WIRE 2192 576 2192 2016
            WIRE 2192 2016 2224 2016
            WIRE 2224 2016 2224 2064
            WIRE 2224 2016 2544 2016
            WIRE 2192 576 2544 576
        END BRANCH
        BEGIN BRANCH XLXN_18(15:0)
            WIRE 1920 1808 2224 1808
            WIRE 2224 1808 2224 1952
            WIRE 2224 1952 2544 1952
            WIRE 2224 640 2224 1808
            WIRE 2224 640 2544 640
        END BRANCH
        BEGIN BRANCH XLXN_19(15:0)
            WIRE 1920 1552 2240 1552
            WIRE 2240 1552 2240 1888
            WIRE 2240 1888 2544 1888
            WIRE 2240 704 2240 1552
            WIRE 2240 704 2544 704
        END BRANCH
        BEGIN BRANCH XLXN_20(15:0)
            WIRE 1920 1296 2256 1296
            WIRE 2256 1296 2256 1824
            WIRE 2256 1824 2544 1824
            WIRE 2256 768 2256 1296
            WIRE 2256 768 2544 768
        END BRANCH
        BEGIN BRANCH XLXN_21(15:0)
            WIRE 1920 1040 2272 1040
            WIRE 2272 1040 2272 1760
            WIRE 2272 1760 2544 1760
            WIRE 2272 832 2272 1040
            WIRE 2272 832 2544 832
        END BRANCH
        BEGIN BRANCH XLXN_22(15:0)
            WIRE 1920 784 2288 784
            WIRE 2288 784 2288 1696
            WIRE 2288 1696 2544 1696
            WIRE 2288 784 2400 784
            WIRE 2400 784 2400 896
            WIRE 2400 896 2544 896
        END BRANCH
        BEGIN BRANCH XLXN_23(15:0)
            WIRE 1920 528 2304 528
            WIRE 2304 528 2304 1632
            WIRE 2304 1632 2544 1632
            WIRE 2304 528 2416 528
            WIRE 2416 528 2416 960
            WIRE 2416 960 2544 960
        END BRANCH
        BEGIN BRANCH XLXN_24(15:0)
            WIRE 1920 272 2320 272
            WIRE 2320 272 2320 1568
            WIRE 2320 1568 2544 1568
            WIRE 2320 272 2432 272
            WIRE 2432 272 2432 1024
            WIRE 2432 1024 2544 1024
        END BRANCH
        BEGIN BRANCH Sel_A(3:0)
            WIRE 2464 224 2464 1088
            WIRE 2464 1088 2528 1088
            WIRE 2528 1088 2544 1088
        END BRANCH
        BEGIN BRANCH Sel_B(3:0)
            WIRE 2368 224 2368 1504
            WIRE 2368 1504 2528 1504
            WIRE 2528 1504 2544 1504
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 2928 1088 2944 1088
            WIRE 2944 1088 3168 1088
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 2928 1504 2944 1504
            WIRE 2944 1504 3168 1504
        END BRANCH
        IOMARKER 3168 1088 A(15:0)
        IOMARKER 3168 1504 B(15:0)
        IOMARKER 2464 224 Sel_A(3:0)
        IOMARKER 2368 224 Sel_B(3:0)
        BEGIN INSTANCE XLXI_15 304 432 R90
        END INSTANCE
    END SHEET
END SCHEMATIC

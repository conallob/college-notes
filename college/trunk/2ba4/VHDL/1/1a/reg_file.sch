VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "Spartan"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1(5:0)
        SIGNAL XLXN_8
        SIGNAL XLXN_20(3:0)
        SIGNAL XLXN_21(3:0)
        SIGNAL Data_Load(3:0)
        SIGNAL B(2:0)
        SIGNAL XLXN_25(3:0)
        SIGNAL XLXN_26(3:0)
        SIGNAL XLXN_27(3:0)
        SIGNAL XLXN_28(3:0)
        SIGNAL XLXN_29(3:0)
        SIGNAL XLXN_30(3:0)
        SIGNAL A(2:0)
        SIGNAL XLXN_33
        SIGNAL S
        SIGNAL XLXN_35(3:0)
        SIGNAL XLXN_37
        SIGNAL XLXN_38
        SIGNAL XLXN_39
        SIGNAL XLXN_40
        SIGNAL XLXN_41
        SIGNAL CLK
        SIGNAL Reset
        SIGNAL XLXN_46
        PORT Input B(2:0)
        PORT Input Data_Load(3:0)
        PORT Input A(2:0)
        PORT Input S
        PORT Input CLK
        PORT Input Reset
        BEGIN BLOCKDEF reg
            TIMESTAMP 2004 3 3 13 45 42
            LINE N 320 32 384 32 
            RECTANGLE N 320 20 384 44 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            RECTANGLE N 64 -192 320 64 
        END BLOCKDEF
        BEGIN BLOCKDEF splitter
            TIMESTAMP 2004 3 3 13 33 48
            RECTANGLE N 64 -384 320 0 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -364 64 -340 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF decoder
            TIMESTAMP 2004 2 27 17 28 20
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF mux6to1
            TIMESTAMP 2004 3 3 13 44 59
            LINE N 64 32 0 32 
            RECTANGLE N 0 20 64 44 
            LINE N 64 96 0 96 
            RECTANGLE N 0 84 64 108 
            LINE N 64 160 0 160 
            RECTANGLE N 0 148 64 172 
            LINE N 64 224 0 224 
            RECTANGLE N 0 212 64 236 
            LINE N 64 288 0 288 
            RECTANGLE N 0 276 64 300 
            LINE N 64 352 0 352 
            RECTANGLE N 0 340 64 364 
            LINE N 320 32 384 32 
            RECTANGLE N 320 20 384 44 
            LINE N 64 -80 0 -80 
            RECTANGLE N 0 -92 64 -68 
            RECTANGLE N 64 -124 320 384 
        END BLOCKDEF
        BEGIN BLOCKDEF mux2to1
            TIMESTAMP 2004 3 3 13 46 15
            LINE N 64 32 0 32 
            RECTANGLE N 0 20 64 44 
            LINE N 64 96 0 96 
            RECTANGLE N 0 84 64 108 
            LINE N 320 32 384 32 
            RECTANGLE N 320 20 384 44 
            LINE N 64 -64 0 -64 
            RECTANGLE N 64 -116 320 128 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 reg
            PIN CLK CLK
            PIN LOAD XLXN_37
            PIN LOAD_DATA(3:0) XLXN_20(3:0)
            PIN DOUT(3:0) XLXN_25(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 reg
            PIN CLK CLK
            PIN LOAD XLXN_38
            PIN LOAD_DATA(3:0) XLXN_20(3:0)
            PIN DOUT(3:0) XLXN_26(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 reg
            PIN CLK CLK
            PIN LOAD XLXN_39
            PIN LOAD_DATA(3:0) XLXN_20(3:0)
            PIN DOUT(3:0) XLXN_27(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 reg
            PIN CLK CLK
            PIN LOAD XLXN_40
            PIN LOAD_DATA(3:0) XLXN_20(3:0)
            PIN DOUT(3:0) XLXN_28(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_6 reg
            PIN CLK CLK
            PIN LOAD XLXN_41
            PIN LOAD_DATA(3:0) XLXN_20(3:0)
            PIN DOUT(3:0) XLXN_29(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_7 reg
            PIN CLK CLK
            PIN LOAD XLXN_8
            PIN LOAD_DATA(3:0) XLXN_20(3:0)
            PIN DOUT(3:0) XLXN_30(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 splitter
            PIN input(5:0) XLXN_1(5:0)
            PIN output0 XLXN_37
            PIN output2 XLXN_38
            PIN output1 XLXN_39
            PIN output3 XLXN_40
            PIN output4 XLXN_41
            PIN output5 XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_9 decoder
            PIN RESET Reset
            PIN CLK CLK
            PIN D_IN(2:0) A(2:0)
            PIN D_OUT(5:0) XLXN_1(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_10 mux6to1
            PIN SEL(2:0) B(2:0)
            PIN A(3:0) XLXN_25(3:0)
            PIN B(3:0) XLXN_26(3:0)
            PIN C(3:0) XLXN_27(3:0)
            PIN D(3:0) XLXN_28(3:0)
            PIN E(3:0) XLXN_29(3:0)
            PIN F(3:0) XLXN_30(3:0)
            PIN MUX_OUT(3:0) XLXN_21(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_11 mux2to1
            PIN SEL S
            PIN A(3:0) Data_Load(3:0)
            PIN B(3:0) XLXN_21(3:0)
            PIN MUX_OUT(3:0) XLXN_20(3:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 1520 736 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1520 1056 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1520 1376 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 1520 1696 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 1520 2016 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_10 2640 688 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_11 464 2288 R0
        END INSTANCE
        BEGIN BRANCH XLXN_1(5:0)
            WIRE 624 320 704 320
            WIRE 704 320 720 320
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1104 640 1152 640
            WIRE 1152 640 1360 640
            WIRE 1360 640 1360 1920
            WIRE 1360 1920 1504 1920
            WIRE 1504 1920 1520 1920
        END BRANCH
        BEGIN BRANCH XLXN_20(3:0)
            WIRE 848 2320 1184 2320
            WIRE 1184 320 1184 704
            WIRE 1184 704 1184 1024
            WIRE 1184 1024 1184 1344
            WIRE 1184 1344 1184 1664
            WIRE 1184 1664 1184 1984
            WIRE 1184 1984 1184 2320
            WIRE 1184 1984 1520 1984
            WIRE 1184 1664 1520 1664
            WIRE 1184 1344 1520 1344
            WIRE 1184 1024 1520 1024
            WIRE 1184 704 1520 704
            WIRE 1184 320 1520 320
        END BRANCH
        BEGIN BRANCH XLXN_21(3:0)
            WIRE 400 2384 400 2496
            WIRE 400 2496 3088 2496
            WIRE 400 2384 448 2384
            WIRE 448 2384 464 2384
            WIRE 3024 720 3040 720
            WIRE 3040 720 3088 720
            WIRE 3088 720 3088 2496
        END BRANCH
        BEGIN BRANCH Data_Load(3:0)
            WIRE 288 2320 304 2320
            WIRE 304 2320 448 2320
            WIRE 448 2320 464 2320
        END BRANCH
        BEGIN BRANCH B(2:0)
            WIRE 2144 176 2144 192
            WIRE 2144 192 2144 608
            WIRE 2144 608 2640 608
        END BRANCH
        BEGIN BRANCH XLXN_25(3:0)
            WIRE 1904 384 2624 384
            WIRE 2624 384 2624 720
            WIRE 2624 720 2640 720
        END BRANCH
        BEGIN BRANCH XLXN_26(3:0)
            WIRE 1904 768 1920 768
            WIRE 1920 768 2272 768
            WIRE 2272 768 2272 784
            WIRE 2272 784 2640 784
        END BRANCH
        BEGIN BRANCH XLXN_27(3:0)
            WIRE 1904 1088 1920 1088
            WIRE 1920 1088 2272 1088
            WIRE 2272 848 2272 1088
            WIRE 2272 848 2640 848
        END BRANCH
        BEGIN BRANCH XLXN_28(3:0)
            WIRE 1904 1408 1920 1408
            WIRE 1920 1408 2288 1408
            WIRE 2288 912 2288 1408
            WIRE 2288 912 2640 912
        END BRANCH
        BEGIN BRANCH XLXN_29(3:0)
            WIRE 1904 1728 1920 1728
            WIRE 1920 1728 2304 1728
            WIRE 2304 976 2304 1728
            WIRE 2304 976 2640 976
        END BRANCH
        BEGIN BRANCH XLXN_30(3:0)
            WIRE 1904 2048 1920 2048
            WIRE 1920 2048 2320 2048
            WIRE 2320 1040 2320 2048
            WIRE 2320 1040 2640 1040
        END BRANCH
        BEGIN BRANCH A(2:0)
            WIRE 192 448 208 448
            WIRE 208 448 224 448
            WIRE 224 448 240 448
        END BRANCH
        IOMARKER 288 2320 Data_Load(3:0)
        IOMARKER 2144 176 B(2:0)
        BEGIN BRANCH S
            WIRE 128 2224 448 2224
            WIRE 448 2224 464 2224
        END BRANCH
        IOMARKER 128 2224 S
        BEGIN INSTANCE XLXI_1 1520 352 R0
        END INSTANCE
        BEGIN BRANCH XLXN_37
            WIRE 1104 320 1152 320
            WIRE 1152 320 1168 320
            WIRE 1168 256 1168 320
            WIRE 1168 256 1504 256
            WIRE 1504 256 1520 256
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 1104 384 1152 384
            WIRE 1152 384 1376 384
            WIRE 1376 384 1376 640
            WIRE 1376 640 1504 640
            WIRE 1504 640 1520 640
        END BRANCH
        BEGIN BRANCH XLXN_39
            WIRE 1104 448 1152 448
            WIRE 1152 448 1312 448
            WIRE 1312 448 1312 960
            WIRE 1312 960 1504 960
            WIRE 1504 960 1520 960
        END BRANCH
        BEGIN BRANCH XLXN_40
            WIRE 1104 512 1152 512
            WIRE 1152 512 1296 512
            WIRE 1296 512 1296 1280
            WIRE 1296 1280 1504 1280
            WIRE 1504 1280 1520 1280
        END BRANCH
        BEGIN BRANCH XLXN_41
            WIRE 1104 576 1152 576
            WIRE 1152 576 1280 576
            WIRE 1280 576 1280 1600
            WIRE 1280 1600 1504 1600
            WIRE 1504 1600 1520 1600
        END BRANCH
        BEGIN INSTANCE XLXI_8 720 672 R0
        END INSTANCE
        IOMARKER 192 448 A(2:0)
        IOMARKER 176 192 CLK
        BEGIN BRANCH Reset
            WIRE 176 320 192 320
            WIRE 192 320 224 320
            WIRE 224 320 240 320
        END BRANCH
        IOMARKER 176 320 Reset
        BEGIN BRANCH CLK
            WIRE 176 192 256 192
            WIRE 256 192 256 384
            WIRE 256 192 1328 192
            WIRE 1328 192 1520 192
            WIRE 1328 192 1328 576
            WIRE 1328 576 1520 576
            WIRE 1328 576 1328 896
            WIRE 1328 896 1520 896
            WIRE 1328 896 1328 1216
            WIRE 1328 1216 1520 1216
            WIRE 1328 1216 1328 1536
            WIRE 1328 1536 1520 1536
            WIRE 1328 1536 1328 1856
            WIRE 1328 1856 1520 1856
            WIRE 240 384 256 384
        END BRANCH
        BEGIN INSTANCE XLXI_9 240 480 R0
        END INSTANCE
    END SHEET
END SCHEMATIC

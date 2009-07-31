VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "Virtex2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL XLXN_12(15:0)
        SIGNAL XLXN_14(8:0)
        SIGNAL XLXN_16(15:0)
        SIGNAL XLXN_17(15:0)
        SIGNAL XLXN_18(15:0)
        SIGNAL XLXN_19(7:0)
        SIGNAL XLXN_22(15:0)
        SIGNAL XLXN_23(15:0)
        SIGNAL XLXN_24(7:0)
        SIGNAL XLXN_25(2:0)
        SIGNAL XLXN_26(2:0)
        SIGNAL XLXN_27(8:0)
        SIGNAL XLXN_28(15:0)
        SIGNAL XLXN_29(15:0)
        SIGNAL XLXN_30(15:0)
        SIGNAL XLXN_31(8:0)
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL XLXN_35
        SIGNAL XLXN_37
        SIGNAL XLXN_38
        SIGNAL XLXN_39
        SIGNAL XLXN_40
        SIGNAL XLXN_41(2:0)
        SIGNAL XLXN_42(4:0)
        SIGNAL XLXN_43
        SIGNAL XLXN_44
        SIGNAL XLXN_45
        SIGNAL XLXN_46
        SIGNAL XLXN_47
        SIGNAL XLXN_48(3:0)
        SIGNAL XLXN_49(3:0)
        SIGNAL XLXN_50(2:0)
        SIGNAL XLXN_51
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL XLXN_54
        SIGNAL XLXN_55
        SIGNAL XLXN_56
        SIGNAL XLXN_57(15:0)
        SIGNAL XLXN_58(15:0)
        BEGIN BLOCKDEF register_file
            TIMESTAMP 2004 5 12 15 37 48
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -288 384 -288 
            RECTANGLE N 320 -300 384 -276 
            LINE N 320 -128 384 -128 
            RECTANGLE N 320 -140 384 -116 
        END BLOCKDEF
        BEGIN BLOCKDEF memory
            TIMESTAMP 2004 5 12 10 42 38
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF control_memory
            TIMESTAMP 2004 5 12 15 9 10
            RECTANGLE N 64 -960 320 0 
            LINE N 64 -928 0 -928 
            RECTANGLE N 0 -940 64 -916 
            LINE N 320 -928 384 -928 
            LINE N 320 -864 384 -864 
            LINE N 320 -800 384 -800 
            LINE N 320 -736 384 -736 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF flag_splitter
            TIMESTAMP 2004 5 12 15 49 14
            LINE N 64 32 0 32 
            LINE N 64 96 0 96 
            LINE N 64 160 0 160 
            LINE N 64 224 0 224 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            RECTANGLE N 64 -128 320 256 
        END BLOCKDEF
        BEGIN BLOCKDEF opcode
            TIMESTAMP 2004 5 12 15 11 36
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -144 0 -144 
            LINE N 64 -64 0 -64 
            RECTANGLE N 0 -76 64 -52 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF zero_fill_16bit
            TIMESTAMP 2004 5 11 18 44 46
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF car
            TIMESTAMP 2004 5 12 11 0 40
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF extend
            TIMESTAMP 2004 5 12 10 50 38
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF pc
            TIMESTAMP 2004 5 12 15 40 16
            RECTANGLE N 64 -384 320 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -352 384 -352 
            RECTANGLE N 320 -364 384 -340 
        END BLOCKDEF
        BEGIN BLOCKDEF functional_unit
            TIMESTAMP 2004 5 12 15 40 58
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -208 0 -208 
            RECTANGLE N 0 -220 64 -196 
            LINE N 64 -128 0 -128 
            RECTANGLE N 0 -140 64 -116 
            LINE N 64 -48 0 -48 
            RECTANGLE N 0 -60 64 -36 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF mux_2to1_16bit
            TIMESTAMP 2004 5 11 18 39 30
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF whatsit
            TIMESTAMP 2004 5 12 15 55 26
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
        BEGIN BLOCK XLXI_28 register_file
            PIN D_IN(3:0)
            PIN CLK XLXN_34
            PIN RESET XLXN_46
            PIN Sel_B(3:0) XLXN_49(3:0)
            PIN Sel_A(3:0) XLXN_48(3:0)
            PIN A(15:0) XLXN_30(15:0)
            PIN B(15:0) XLXN_29(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_29 memory
            PIN CLK XLXN_34
            PIN MW XLXN_45
            PIN A(8:0) XLXN_14(8:0)
            PIN Din(15:0)
            PIN Dout(15:0) XLXN_58(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_30 control_memory
            PIN place(7:0) XLXN_19(7:0)
            PIN MC XLXN_54
            PIN IL XLXN_53
            PIN PI XLXN_56
            PIN PL XLXN_55
            PIN TD XLXN_51
            PIN TA
            PIN TB
            PIN MB XLXN_43
            PIN MD XLXN_47
            PIN RW XLXN_46
            PIN MM XLXN_44
            PIN MW XLXN_45
            PIN NA(7:0) XLXN_24(7:0)
            PIN MS(2:0) XLXN_41(2:0)
            PIN FS(4:0) XLXN_42(4:0)
        END BLOCK
        BEGIN BLOCK XLXI_31 flag_splitter
            PIN sel(2:0) XLXN_41(2:0)
            PIN MUX_OUT XLXN_33
            PIN v XLXN_38
            PIN n XLXN_37
            PIN z XLXN_39
            PIN c XLXN_40
        END BLOCK
        BEGIN BLOCK XLXI_32 opcode
            PIN IL XLXN_53
            PIN CLK XLXN_34
            PIN DATA_IN(15:0) XLXN_58(15:0)
            PIN DR(2:0) XLXN_26(2:0)
            PIN SA(2:0) XLXN_50(2:0)
            PIN SB(2:0) XLXN_25(2:0)
            PIN OPCODE_OUT(7:0) XLXN_23(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_33 zero_fill_16bit
            PIN input(2:0) XLXN_25(2:0)
            PIN z(15:0) XLXN_28(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_34 car
            PIN CLK XLXN_34
            PIN Reset
            PIN Incr XLXN_33
            PIN Din(7:0) XLXN_22(15:0)
            PIN Dout(7:0) XLXN_19(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_35 extend
            PIN dr(2:0) XLXN_26(2:0)
            PIN sb(2:0) XLXN_25(2:0)
            PIN extend_out(15:0) XLXN_27(8:0)
        END BLOCK
        BEGIN BLOCK XLXI_36 pc
            PIN CLK XLXN_34
            PIN PI XLXN_55
            PIN PL XLXN_56
            PIN Reset
            PIN D(8:0) XLXN_27(8:0)
            PIN Offset(2:0)
            PIN pc_out(8:0) XLXN_31(8:0)
        END BLOCK
        BEGIN BLOCK XLXI_37 functional_unit
            PIN A(15:0) XLXN_30(15:0)
            PIN B(15:0) XLXN_16(15:0)
            PIN G(3:0) XLXN_42(4:0)
            PIN H(1:0)
            PIN C XLXN_40
            PIN F(15:0) XLXN_18(15:0)
            PIN Z XLXN_39
            PIN V XLXN_38
            PIN N XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_38 mux_2to1_16bit
            PIN SEL XLXN_47
            PIN A(15:0) XLXN_18(15:0)
            PIN B(15:0) XLXN_58(15:0)
            PIN MUX_OUT(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_39 mux_2to1_16bit
            PIN SEL XLXN_43
            PIN A(15:0) XLXN_29(15:0)
            PIN B(15:0) XLXN_28(15:0)
            PIN MUX_OUT(15:0) XLXN_16(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_40 mux_2to1_16bit
            PIN SEL XLXN_44
            PIN A(15:0) XLXN_30(15:0)
            PIN B(15:0) XLXN_31(8:0)
            PIN MUX_OUT(15:0) XLXN_14(8:0)
        END BLOCK
        BEGIN BLOCK XLXI_41 mux_2to1_16bit
            PIN SEL XLXN_54
            PIN A(15:0) XLXN_24(7:0)
            PIN B(15:0) XLXN_23(15:0)
            PIN MUX_OUT(15:0) XLXN_22(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_42 whatsit
            PIN input2
            PIN input1(2:0) XLXN_25(2:0)
            PIN output(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_43 whatsit
            PIN input2 XLXN_51
            PIN input1(2:0) XLXN_50(2:0)
            PIN output(3:0) XLXN_48(3:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_28 2496 560 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_29 2912 1728 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_31 384 496 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_33 1600 1200 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_30 544 2016 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_34 1248 1568 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_35 1904 144 R180
        END INSTANCE
        BEGIN INSTANCE XLXI_36 848 176 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_37 2448 1744 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_39 2512 1184 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_40 3024 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_32 944 720 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_38 2480 2336 R180
        END INSTANCE
        BEGIN BRANCH XLXN_14(8:0)
            WIRE 3008 1648 3008 1728
            WIRE 3008 1648 3184 1648
            WIRE 3184 1584 3184 1648
        END BRANCH
        BEGIN BRANCH XLXN_16(15:0)
            WIRE 2656 1648 2656 1744
            WIRE 2656 1648 2672 1648
            WIRE 2672 1568 2672 1648
        END BRANCH
        BEGIN BRANCH XLXN_18(15:0)
            WIRE 2480 2432 2672 2432
            WIRE 2672 2128 2672 2432
        END BRANCH
        BEGIN BRANCH XLXN_19(7:0)
            WIRE 1472 1952 1472 2016
        END BRANCH
        BEGIN INSTANCE XLXI_41 704 1216 R90
        END INSTANCE
        BEGIN BRANCH XLXN_22(15:0)
            WIRE 864 1600 864 1664
            WIRE 864 1664 1024 1664
            WIRE 1024 1504 1024 1664
            WIRE 1024 1504 1280 1504
            WIRE 1280 1504 1280 1568
        END BRANCH
        BEGIN BRANCH XLXN_23(15:0)
            WIRE 736 1152 736 1216
            WIRE 736 1152 976 1152
            WIRE 976 1104 976 1152
        END BRANCH
        BEGIN BRANCH XLXN_24(7:0)
            WIRE 480 1168 480 2464
            WIRE 480 2464 704 2464
            WIRE 480 1168 800 1168
            WIRE 800 1168 800 1216
            WIRE 704 2400 704 2464
        END BRANCH
        BEGIN BRANCH XLXN_25(2:0)
            WIRE 1024 1168 1024 1264
            WIRE 1024 1264 1040 1264
            WIRE 1040 1264 2064 1264
            WIRE 1040 1264 1040 1328
            WIRE 1040 1328 1328 1328
            WIRE 1024 1168 1600 1168
            WIRE 1040 1104 1040 1264
            WIRE 1328 864 1328 1328
            WIRE 1328 864 1856 864
            WIRE 1904 176 2064 176
            WIRE 2064 176 2064 1264
        END BRANCH
        BEGIN BRANCH XLXN_26(2:0)
            WIRE 1168 1104 1168 1248
            WIRE 1168 1248 2048 1248
            WIRE 1904 240 2048 240
            WIRE 2048 240 2048 1248
        END BRANCH
        BEGIN BRANCH XLXN_27(8:0)
            WIRE 944 112 944 176
            WIRE 944 112 1312 112
            WIRE 1312 112 1312 240
            WIRE 1312 240 1520 240
        END BRANCH
        BEGIN BRANCH XLXN_28(15:0)
            WIRE 1984 1168 2544 1168
            WIRE 2544 1168 2544 1184
        END BRANCH
        BEGIN BRANCH XLXN_29(15:0)
            WIRE 2608 1056 2608 1184
            WIRE 2608 1056 2624 1056
            WIRE 2624 944 2624 1056
        END BRANCH
        BEGIN BRANCH XLXN_30(15:0)
            WIRE 2736 1664 2736 1744
            WIRE 2736 1664 2784 1664
            WIRE 2784 944 2784 1136
            WIRE 2784 1136 2784 1664
            WIRE 2784 1136 3120 1136
            WIRE 3120 1136 3120 1200
        END BRANCH
        BEGIN BRANCH XLXN_31(8:0)
            WIRE 1200 560 1200 624
            WIRE 1200 624 1296 624
            WIRE 1296 480 1296 624
            WIRE 1296 480 3056 480
            WIRE 3056 480 3056 1200
        END BRANCH
        BEGIN BRANCH XLXN_33
            WIRE 480 880 480 944
            WIRE 480 944 544 944
            WIRE 544 944 544 1136
            WIRE 544 1136 1344 1136
            WIRE 1344 1136 1344 1568
        END BRANCH
        BEGIN BRANCH XLXN_34
            WIRE 1088 672 1088 720
            WIRE 1088 672 1376 672
            WIRE 1376 672 1408 672
            WIRE 1408 672 1472 672
            WIRE 1472 672 1472 1568
            WIRE 1200 128 1376 128
            WIRE 1376 128 1376 672
            WIRE 1200 128 1200 176
            WIRE 1408 496 1408 672
            WIRE 1408 496 2720 496
            WIRE 2720 496 2720 560
            WIRE 2720 496 2960 496
            WIRE 2960 496 2960 1632
            WIRE 2960 1632 3136 1632
            WIRE 3136 1632 3136 1728
        END BRANCH
        BEGIN BRANCH XLXN_37
            WIRE 288 496 288 2000
            WIRE 288 2000 1648 2000
            WIRE 1648 2000 1648 2192
            WIRE 1648 2192 2480 2192
            WIRE 2480 2128 2480 2192
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 352 496 352 1120
            WIRE 352 1120 1584 1120
            WIRE 1584 1120 1584 2176
            WIRE 1584 2176 2544 2176
            WIRE 2544 2128 2544 2176
        END BRANCH
        BEGIN BRANCH XLXN_39
            WIRE 224 496 224 1968
            WIRE 224 1968 1600 1968
            WIRE 1600 1968 1600 2144
            WIRE 1600 2144 2608 2144
            WIRE 2608 2128 2608 2144
        END BRANCH
        BEGIN BRANCH XLXN_40
            WIRE 160 496 160 1984
            WIRE 160 1984 1680 1984
            WIRE 1680 1984 1680 2256
            WIRE 1680 2256 2736 2256
            WIRE 2736 2128 2736 2256
        END BRANCH
        BEGIN BRANCH XLXN_41(2:0)
            WIRE 368 432 416 432
            WIRE 416 432 416 496
            WIRE 368 432 368 2448
            WIRE 368 2448 640 2448
            WIRE 640 2400 640 2448
        END BRANCH
        BEGIN BRANCH XLXN_42(4:0)
            WIRE 576 2400 576 2416
            WIRE 576 2416 1744 2416
            WIRE 1744 1680 1744 2416
            WIRE 1744 1680 2576 1680
            WIRE 2576 1680 2576 1744
        END BRANCH
        BEGIN BRANCH XLXN_43
            WIRE 1024 2400 1024 2480
            WIRE 1024 2480 2016 2480
            WIRE 2016 1088 2016 2480
            WIRE 2016 1088 2672 1088
            WIRE 2672 1088 2672 1184
        END BRANCH
        BEGIN BRANCH XLXN_44
            WIRE 832 2400 832 2464
            WIRE 832 2464 2000 2464
            WIRE 2000 1152 2000 2464
            WIRE 2000 1152 3184 1152
            WIRE 3184 1152 3184 1200
        END BRANCH
        BEGIN BRANCH XLXN_45
            WIRE 768 2400 768 2432
            WIRE 768 2432 1664 2432
            WIRE 1664 1696 1664 2432
            WIRE 1664 1696 3072 1696
            WIRE 3072 1696 3072 1728
        END BRANCH
        BEGIN BRANCH XLXN_46
            WIRE 896 2400 896 2448
            WIRE 896 2448 1648 2448
            WIRE 1648 2272 1648 2448
            WIRE 1648 2272 2144 2272
            WIRE 2144 512 2144 2272
            WIRE 2144 512 2656 512
            WIRE 2656 512 2656 560
        END BRANCH
        BEGIN BRANCH XLXN_47
            WIRE 960 2400 960 2640
            WIRE 960 2640 2544 2640
            WIRE 2480 2496 2544 2496
            WIRE 2544 2496 2544 2640
        END BRANCH
        BEGIN INSTANCE XLXI_42 1856 896 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_43 1856 528 M180
        END INSTANCE
        BEGIN BRANCH XLXN_48(3:0)
            WIRE 2240 624 2304 624
            WIRE 2304 528 2304 624
            WIRE 2304 528 2528 528
            WIRE 2528 528 2528 560
        END BRANCH
        BEGIN BRANCH XLXN_49(3:0)
            WIRE 2240 784 2288 784
            WIRE 2288 544 2288 784
            WIRE 2288 544 2592 544
            WIRE 2592 544 2592 560
        END BRANCH
        BEGIN BRANCH XLXN_50(2:0)
            WIRE 1104 1104 1104 1152
            WIRE 1104 1152 1312 1152
            WIRE 1312 560 1312 1152
            WIRE 1312 560 1856 560
        END BRANCH
        BEGIN BRANCH XLXN_51
            WIRE 1216 2400 1216 2560
            WIRE 1216 2560 2080 2560
            WIRE 1840 624 1856 624
            WIRE 1840 624 1840 784
            WIRE 1840 784 1856 784
            WIRE 1840 784 1840 992
            WIRE 1840 992 2080 992
            WIRE 2080 992 2080 2560
        END BRANCH
        BEGIN BRANCH XLXN_53
            WIRE 1168 640 1168 720
            WIRE 1168 640 1296 640
            WIRE 1296 640 1296 1280
            WIRE 1296 1280 1632 1280
            WIRE 1632 1280 1632 2496
            WIRE 1408 2400 1408 2496
            WIRE 1408 2496 1632 2496
        END BRANCH
        BEGIN BRANCH XLXN_54
            WIRE 528 1184 864 1184
            WIRE 864 1184 864 1216
            WIRE 528 1184 528 2544
            WIRE 528 2544 1472 2544
            WIRE 1472 2400 1472 2544
        END BRANCH
        BEGIN BRANCH XLXN_55
            WIRE 1136 96 1136 176
            WIRE 1136 96 1424 96
            WIRE 1424 96 1424 1232
            WIRE 1424 1232 1616 1232
            WIRE 1616 1232 1616 2624
            WIRE 1280 2400 1280 2624
            WIRE 1280 2624 1616 2624
        END BRANCH
        BEGIN BRANCH XLXN_56
            WIRE 1072 144 1072 176
            WIRE 1072 144 1504 144
            WIRE 1504 144 1504 1360
            WIRE 1504 1360 1728 1360
            WIRE 1728 1360 1728 2512
            WIRE 1344 2400 1344 2512
            WIRE 1344 2512 1728 2512
        END BRANCH
        BEGIN BRANCH XLXN_58(15:0)
            WIRE 1008 656 1008 720
            WIRE 1008 656 1264 656
            WIRE 1264 656 1264 720
            WIRE 1264 720 1280 720
            WIRE 1280 720 1280 960
            WIRE 1280 960 2896 960
            WIRE 2896 960 2896 2384
            WIRE 2896 2384 3136 2384
            WIRE 2480 2368 3136 2368
            WIRE 3136 2368 3136 2384
            WIRE 3136 2112 3136 2368
        END BRANCH
    END SHEET
END SCHEMATIC

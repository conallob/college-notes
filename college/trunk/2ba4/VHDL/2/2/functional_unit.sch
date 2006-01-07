VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "Virtex2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL XLXN_2(15:0)
        SIGNAL F(15:0)
        SIGNAL XLXN_5(15:0)
        SIGNAL B(15:0)
        SIGNAL A(15:0)
        SIGNAL G(3:0)
        SIGNAL H(1:0)
        SIGNAL C
        SIGNAL Z
        SIGNAL XLXN_12
        SIGNAL V
        SIGNAL N
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        PORT Output C
        PORT Output F(15:0)
        PORT Output Z
        PORT Input A(15:0)
        PORT Input B(15:0)
        PORT Input G(3:0)
        PORT Input H(1:0)
        PORT Output V
        PORT Output N
        BEGIN BLOCKDEF alu
            TIMESTAMP 2004 5 12 12 54 40
            LINE N 320 32 384 32 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            LINE N 320 -64 384 -64 
            RECTANGLE N 320 -76 384 -52 
            RECTANGLE N 64 -192 320 64 
        END BLOCKDEF
        BEGIN BLOCKDEF shifter_16bit
            TIMESTAMP 2004 5 12 12 26 18
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
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
        BEGIN BLOCKDEF zero_detect_16bit
            TIMESTAMP 2004 5 11 18 49 10
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF n_check_16bit
            TIMESTAMP 2004 5 12 12 45 16
            RECTANGLE N 64 -128 320 -64 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF xor_gate
            TIMESTAMP 2004 5 12 12 44 34
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 shifter_16bit
            PIN s(1:0) H(1:0)
            PIN B(15:0) B(15:0)
            PIN G(15:0) XLXN_2(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 mux_2to1_16bit
            PIN SEL XLXN_15
            PIN A(15:0) XLXN_5(15:0)
            PIN B(15:0) XLXN_2(15:0)
            PIN MUX_OUT(15:0) F(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 zero_detect_16bit
            PIN input(15:0) XLXN_5(15:0)
            PIN z Z
        END BLOCK
        BEGIN BLOCK XLXI_6 n_check_16bit
            PIN input(15:0) XLXN_5(15:0)
            PIN n N
        END BLOCK
        BEGIN BLOCK XLXI_7 xor_gate
            PIN a XLXN_17
            PIN b C
            PIN output V
        END BLOCK
        BEGIN BLOCK XLXI_8 alu
            PIN A(15:0) A(15:0)
            PIN B(15:0) B(15:0)
            PIN G_SEL(3:0) G(3:0)
            PIN C_OUT C
            PIN G(15:0) XLXN_5(15:0)
            PIN C_IN XLXN_17
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 848 1328 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1904 1040 R0
        END INSTANCE
        BEGIN BRANCH XLXN_2(15:0)
            WIRE 1232 1232 1568 1232
            WIRE 1568 1008 1568 1232
            WIRE 1568 1008 1904 1008
        END BRANCH
        BEGIN BRANCH F(15:0)
            WIRE 2288 880 2304 880
            WIRE 2304 880 2592 880
        END BRANCH
        BEGIN BRANCH XLXN_5(15:0)
            WIRE 1232 688 1568 688
            WIRE 1568 688 1568 944
            WIRE 1568 944 1904 944
            WIRE 1568 688 1904 688
            WIRE 1568 496 1568 688
            WIRE 1568 496 1904 496
        END BRANCH
        BEGIN INSTANCE XLXI_5 1904 720 R0
        END INSTANCE
        BEGIN BRANCH B(15:0)
            WIRE 464 656 672 656
            WIRE 672 656 848 656
            WIRE 672 656 672 1296
            WIRE 672 1296 848 1296
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 464 592 480 592
            WIRE 480 592 832 592
            WIRE 832 592 848 592
        END BRANCH
        BEGIN BRANCH G(3:0)
            WIRE 448 720 464 720
            WIRE 464 720 720 720
            WIRE 720 720 832 720
            WIRE 832 720 848 720
        END BRANCH
        BEGIN BRANCH H(1:0)
            WIRE 448 1232 832 1232
            WIRE 832 1232 848 1232
        END BRANCH
        BEGIN BRANCH C
            WIRE 1232 592 1248 592
            WIRE 1248 592 1472 592
            WIRE 1472 592 2592 592
            WIRE 1472 352 1472 592
            WIRE 1472 352 1904 352
        END BRANCH
        IOMARKER 2592 592 C
        BEGIN BRANCH Z
            WIRE 2288 688 2304 688
            WIRE 2304 688 2592 688
        END BRANCH
        IOMARKER 2592 688 Z
        IOMARKER 2592 880 F(15:0)
        IOMARKER 464 592 A(15:0)
        IOMARKER 464 656 B(15:0)
        IOMARKER 448 720 G(3:0)
        IOMARKER 448 1232 H(1:0)
        BEGIN INSTANCE XLXI_6 1904 592 R0
        END INSTANCE
        BEGIN BRANCH V
            WIRE 2288 288 2304 288
            WIRE 2304 288 2592 288
        END BRANCH
        BEGIN BRANCH N
            WIRE 2288 496 2304 496
            WIRE 2304 496 2592 496
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 368 880 1904 880
        END BRANCH
        IOMARKER 2592 496 N
        BEGIN INSTANCE XLXI_7 1904 384 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_8 848 752 R0
        END INSTANCE
        BEGIN BRANCH XLXN_17
            WIRE 1232 784 1440 784
            WIRE 1440 288 1440 784
            WIRE 1440 288 1904 288
        END BRANCH
        IOMARKER 2592 288 V
    END SHEET
END SCHEMATIC

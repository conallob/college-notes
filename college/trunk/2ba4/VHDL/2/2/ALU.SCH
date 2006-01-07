VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "Virtex2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL A(15:0)
        SIGNAL B(15:0)
        SIGNAL C_OUT
        SIGNAL XLXN_22(15:0)
        SIGNAL XLXN_23(15:0)
        SIGNAL G(15:0)
        SIGNAL XLXN_28(1:0)
        SIGNAL C_IN
        SIGNAL XLXN_30
        SIGNAL G_SEL(3:0)
        PORT Input A(15:0)
        PORT Input B(15:0)
        PORT Output C_OUT
        PORT Output G(15:0)
        PORT Input G_SEL(3:0)
        PORT Output C_IN
        BEGIN BLOCKDEF adder_16
            TIMESTAMP 2004 5 12 11 46 30
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            LINE N 320 -64 384 -64 
            RECTANGLE N 320 -76 384 -52 
        END BLOCKDEF
        BEGIN BLOCKDEF logic_16bit
            TIMESTAMP 2004 5 12 11 49 36
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
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
        BEGIN BLOCKDEF alu_splitter
            TIMESTAMP 2004 5 12 12 14 36
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCK XLXI_5 adder_16
            PIN C0 C_IN
            PIN B(15:0) B(15:0)
            PIN A(15:0) A(15:0)
            PIN C4 C_OUT
            PIN S(15:0) XLXN_22(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_6 logic_16bit
            PIN SEL(1:0) XLXN_28(1:0)
            PIN A(15:0) A(15:0)
            PIN B(15:0) B(15:0)
            PIN MUX_OUT(15:0) XLXN_23(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 mux_2to1_16bit
            PIN SEL XLXN_30
            PIN A(15:0) XLXN_22(15:0)
            PIN B(15:0) XLXN_23(15:0)
            PIN MUX_OUT(15:0) G(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 alu_splitter
            PIN input(3:0) G_SEL(3:0)
            PIN s2 XLXN_30
            PIN c_in C_IN
            PIN sel(1:0) XLXN_28(1:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_5 1312 384 M180
        END INSTANCE
        BEGIN INSTANCE XLXI_6 1312 784 M180
        END INSTANCE
        BEGIN BRANCH A(15:0)
            WIRE 560 416 1120 416
            WIRE 1120 416 1312 416
            WIRE 1120 416 1120 816
            WIRE 1120 816 1312 816
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 560 480 1136 480
            WIRE 1136 480 1312 480
            WIRE 1136 480 1136 880
            WIRE 1136 880 1312 880
        END BRANCH
        BEGIN BRANCH C_OUT
            WIRE 1696 544 1712 544
            WIRE 1712 544 2416 544
        END BRANCH
        BEGIN INSTANCE XLXI_8 1952 816 R0
        END INSTANCE
        BEGIN BRANCH XLXN_22(15:0)
            WIRE 1696 448 1824 448
            WIRE 1824 448 1824 720
            WIRE 1824 720 1952 720
        END BRANCH
        BEGIN BRANCH XLXN_23(15:0)
            WIRE 1696 944 1824 944
            WIRE 1824 784 1824 944
            WIRE 1824 784 1952 784
        END BRANCH
        BEGIN BRANCH G(15:0)
            WIRE 2336 656 2352 656
            WIRE 2352 656 2416 656
        END BRANCH
        IOMARKER 2416 656 G(15:0)
        IOMARKER 560 416 A(15:0)
        IOMARKER 560 480 B(15:0)
        BEGIN BRANCH XLXN_28(1:0)
            WIRE 976 944 1296 944
            WIRE 1296 944 1312 944
        END BRANCH
        BEGIN INSTANCE XLXI_9 592 976 R0
        END INSTANCE
        BEGIN BRANCH C_IN
            WIRE 976 880 1104 880
            WIRE 1104 880 1104 1136
            WIRE 1104 1136 1760 1136
            WIRE 1104 544 1104 880
            WIRE 1104 544 1312 544
            WIRE 1760 464 1760 1136
            WIRE 1760 464 2416 464
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 976 816 1088 816
            WIRE 1088 656 1952 656
            WIRE 1088 656 1088 816
        END BRANCH
        IOMARKER 2416 544 C_OUT
        BEGIN BRANCH G_SEL(3:0)
            WIRE 560 816 576 816
            WIRE 576 816 592 816
        END BRANCH
        IOMARKER 560 816 G_SEL(3:0)
        IOMARKER 2416 464 C_IN
    END SHEET
END SCHEMATIC

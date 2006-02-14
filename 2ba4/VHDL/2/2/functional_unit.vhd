library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity reg_file is 
	Port ( 
			src_s0, src_s1, src_s2, src_s3, src_s4 : in std_logic; 
			des_A0, des_A1 : in std_logic; 
			Clk : in std_logic; 
			data_src : in std_logic; 
			data : in std_logic_vector(15 downto 0); 
			reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0)
			); 
	end reg_file;

	architecture Behavioral of reg_file is 

	-- components 
	
	-- 16 bit Register
	
	COMPONENT reg_16bit PORT( 
							  D : IN std_logic_vector(15 downto 0); 
							  load, Clk : IN std_logic ;
							  Q : OUT std_logic_vector(15 downto 0) 
								); 
	END COMPONENT; 
	
	-- 4 to 9 Decoder 
	
	COMPONENT decoder PORT(
										A : IN std_logic_vector(3 downto 0);
										reset, clk : in std_logic ;
										d_out : out std_logic_vector(8 downto 0)
										); 
	
	END COMPONENT; 
	
	-- 2 to 1 line multiplexer 
	
	COMPONENT mux_2to1_16bit PORT(
									s : IN std_logic ;
									In0, In1 : IN std_logic_vector(15 downto 0);
									Z : OUT std_logic_vector(15 downto 0)
									); 
	END COMPONENT;

	-- 9 to 1 line multiplexer 

	COMPONENT mux_9to1_16bit PORT(
									In0, In1, In2, In3, In4, In5, In6, In7, In8 
											: IN std_logic_vector(15 downto 0);
									Sel : IN std_logic_vector(3 downto 0);
									Z : OUT std_logic_vector(15 downto 0)
									);
	END COMPONENT; 
	
	-- signals 
	
	signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, 
				load_reg5, load_reg6, load_reg7, loadreg8 : std_logic;
				
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, 
				reg7_q, reg8_q, data_src_mux_out, src_reg : std_logic_vector(15 downto 0);

	signal decoder_out : std_logic_vector(8 downto 0);

	begin 
	
	-- port maps ;-) 
	
	-- register 0 
	
		reg00: reg_16bit PORT MAP( 
									D => data_src_mux_out,
									load => load_reg0,
									Clk=> Clk,
									Q => reg0_q
									); 
									
	-- register 1
	
		reg01: reg_16bit PORT MAP( 
									D => data_src_mux_out,
									load => load_reg1,
									Clk=> Clk,
									Q => reg1_q
									); 
	-- register 2
								
		reg02: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg2,
									Clk => Clk,
									Q => reg2_q
									); 
									
	-- register 3
	
		reg03: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg3,
									Clk => Clk,
									Q => reg3_q
									); 
	-- register 4

		reg04: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg4,
									Clk => Clk,
									Q => reg4_q
									); 
	-- register 5

		reg05: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg5,
									Clk => Clk,
									Q => reg5_q
									); 
									
	-- register 6

		reg06: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg6,
									Clk => Clk,
									Q => reg6_q
									); 

	-- register 7

		reg07: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg7,
									Clk => Clk,
									Q => reg7_q
									); 
	-- register 8

		reg08: reg_16bit PORT MAP(
									D => data_src_mux_out,
									load => load_reg8,
									Clk => Clk,
									Q => reg8_q
									); 


	-- Destination register decoder 
	
		des_decoder: decoder PORT MAP(
												A => des_A,
												Q => dec_out
												);

		load_reg0 <= dec_out(0);
		load_reg1 <= dec_out(1);
		load_reg2 <= dec_out(2);
		load_reg3 <= dec_out(3);
		load_reg4 <= dec_out(4);
		load_reg5 <= dec_out(5);
		load_reg6 <= dec_out(6);
		load_reg7 <= dec_out(7);
		load_reg8 <= dec_out(8);
											

	-- 2 to 1 Data source multiplexer
	
		data_src_mux2_4bit: mux_2to1_16bit PORT MAP(
																s => data_src,
																In0 => data,
																In1 => src_reg,
																Z => data_src_mux_out
																); 
															
	-- 4 to 1 source register multiplexer 
		
		Inst_mux4_4bit: mux_9to1_16bit PORT MAP(
														In0 => reg0_q,
														In1 => reg1_q,
														In2 => reg2_q,
														In3 => reg3_q,
														In4 => reg4_q,
														In5 => reg5_q,
														In6 => reg6_q,
														In7 => reg7_q,									
														In8 => reg8_q,
														S => src_s,
														Z => src_reg
														);
														
		reg0 <= reg0_q;
		reg1 <= reg1_q;
		reg2 <= reg2_q;
		reg3 <= reg3_q;
		reg4 <= reg4_q;
		reg5 <= reg5_q;
		reg6 <= reg6_q;
		reg7 <= reg7_q;
		reg8 <= reg8_q;
		
	end Behavioral;

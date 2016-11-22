-------------------------------------------------------
-- Author: Tiago Guido Piai                          --
-- github: tiagopiai											  --
-- email: tiago.piai@hotmail.com							  --
-------------------------------------------------------
-- File: processor_s.vhd                             --
-- Description: Simple processor top entity. Put     --
--					 together the components.				  -- 
-------------------------------------------------------

-------------------------------------------------------
----------------------- LIBRARY -----------------------
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-------------------------------------------------------
----------------------- ENTITY ------------------------
-------------------------------------------------------
ENTITY processor_s IS
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		opcode: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		load_A, load_B, sel, rst, clk, cin: IN STD_LOGIC;
		A_out, B_out, ALU_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cout: OUT STD_LOGIC);
END processor_s;

-------------------------------------------------------
-------------------- ARCHITECTURE ---------------------
-------------------------------------------------------
ARCHITECTURE func OF processor_s IS

-- MUX
COMPONENT mux2to1
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		sel: IN STD_LOGIC;
		O: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

-- REGISTER
COMPONENT reg_4bits
PORT(Data_in: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		rst, clk, en: IN STD_LOGIC;
		Data_out: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

-- ALU
COMPONENT ALU_4bits
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		opcode: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		cin: IN STD_LOGIC;
		Cout: OUT STD_LOGIC;
		O: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

-- SIGNALS
SIGNAL MuxA_out, MuxB_out: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL regA_out, regB_out: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ALU_out: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
A_out <= regA_out;
B_out <= regB_out;
ALU_o <= ALU_out;

MuxA: mux2to1 PORT MAP (ALU_out, A, sel, MuxA_out);
MuxB: mux2to1 PORT MAP (ALU_out, B, sel, MuxB_out);
RegA: reg_4bits PORT MAP (MuxA_out, rst, clk, load_A, regA_out);
RegB: reg_4bits PORT MAP (MuxB_out, rst, clk, load_B, regB_out);
ALU:  ALU_4bits PORT MAP (regA_out, regB_out, opcode, cin, Cout, ALU_out);

END func;

-------------------------------------------------------
-- Author: Tiago Guido Piai                          --
-- github: tiagopiai											  --
-- email: tiago.piai@hotmail.com							  --
-------------------------------------------------------
-- File: processor_s_tb.vhd                          --
-- Description: Simple processor test bench. Check   --
--					 all operations.         				  -- 
-------------------------------------------------------

-------------------------------------------------------
----------------------- LIBRARY -----------------------
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-------------------------------------------------------
----------------------- ENTITY ------------------------
-------------------------------------------------------
ENTITY processor_s_tb IS
END processor_s_tb;

-------------------------------------------------------
-------------------- ARCHITECTURE ---------------------
-------------------------------------------------------
ARCHITECTURE behavior OF processor_s_tb IS

COMPONENT processor_s
PORT(	A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		opcode : IN std_logic_vector(3 downto 0);
		load_A : IN std_logic;
		load_B : IN std_logic;
		sel : IN std_logic;
		rst : IN std_logic;
		clk : IN std_logic;
		cin : IN std_logic;
		A_out : OUT std_logic_vector(3 downto 0);
		B_out : OUT std_logic_vector(3 downto 0);
		ALU_o : OUT std_logic_vector(3 downto 0);
		Cout : OUT std_logic
		);
END COMPONENT;

--Inputs
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
SIGNAL opcode : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
SIGNAL load_A : STD_LOGIC := '0';
SIGNAL load_B : STD_LOGIC := '0';
SIGNAL sel : STD_LOGIC := '0';
SIGNAL rst : STD_LOGIC := '0';
SIGNAL clk : STD_LOGIC := '1';
SIGNAL cin : STD_LOGIC := '0';

--OUTPUTS
SIGNAL A_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ALU_o : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cout : STD_LOGIC;

BEGIN
uut: processor_s PORT MAP (	A => A,
										B => B,
										opcode => opcode,
										load_A => load_A,
										load_B => load_B,
										sel => sel,
										rst => rst,
										clk => clk,
										cin => cin,
										A_out => A_out,
										B_out => B_out,
										ALU_o => ALU_o,
										Cout => Cout);

-- Clock PROCESS
pclk: PROCESS
BEGIN
	clk <= NOT clk;
	WAIT FOR 1 NS;
END PROCESS;

data:PROCESS
BEGIN
	-- COMMAND 0
	-- OPERATION: NOT A
	A <= x"1";
	B <= x"3";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0000";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 1
	-- OPERATION: NOT B
	A <= x"2";
	B <= x"8";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0001";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 2
	-- OPERATION: A AND BA <= x"E";
	B <= x"2";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0010";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 3
	-- OPERATION: A OR B
	A <= x"5";
	B <= x"D";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0011";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 4
	-- OPERATION: A NAND B
	A <= x"7";
	B <= x"3";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0100";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 5
	-- OPERATION: A NOR B
	A <= x"C";
	B <= x"6";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0101";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 6
	-- OPERATION: A XOR B
	A <= x"A";
	B <= x"3";
	sel <= '1';
	load_A <= '1';load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0110";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 7
	-- OPERATION: A XNOR B
	A <= x"1";
	B <= x"D";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "0111";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 8
	-- OPERATION: TRANSFER A
	A <= x"2";
	B <= x"5";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1000";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 9
	-- OPERATION: INCREMENT A
	A <= x"A";
	B <= x"1";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1001";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 10
	-- OPERATION: DECREMENT A
	A <= x"5";
	B <= x"2";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1010";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 11
	-- OPERATION: TRANSFER BA <= x"F";
	B <= x"3";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1011";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 12
	-- OPERATION: INCREMENT B
	A <= x"4";
	B <= x"C";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1100";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 13
	-- OPERATION: DECREMENT B
	A <= x"3";
	B <= x"5";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1101";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 14
	-- OPERATION: A + B
	A <= x"4";
	B <= x"9";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1110";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- COMMAND 15
	-- OPERATION: A - B
	A <= x"7";
	B <= x"3";sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1111";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- CHECKING FOR CARRY OUT IN THE SUM
	-- COMMAND 14
	-- OPERATION: A + B
	A <= x"5";
	B <= x"C";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1110";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	-- CHECKING FOR ALU_out TRANSFER
	-- COMMAND 12
	-- OPERATION: INCREMENT B
	A <= x"2";
	B <= x"3";
	sel <= '1';
	load_A <= '1';
	load_B <= '1';
	WAIT FOR 1 NS;
	
	opcode <= "1100";
	WAIT FOR 1 NS;
	
	load_A <= '0';
	load_B <= '0';
	WAIT FOR 2 NS;
	
	sel <= '0';
	load_A <= '1';
	WAIT FOR 2 NS;
	load_A <= '0';
	
	WAIT;
END PROCESS;
END;

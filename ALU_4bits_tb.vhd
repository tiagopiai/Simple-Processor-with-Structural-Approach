-------------------------------------------------------
-- Author: Tiago Guido Piai                          --
-- github: tiagopiai											  --
-- email: tiago.piai@hotmail.com							  --
-------------------------------------------------------
-- File: processor.vhd                               --
-- Description: Simple processor top entity. Put     --
--					 together the components.				  -- 
-------------------------------------------------------

-------------------------------------------------------
----------------------- LIBRARY -----------------------
-------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-------------------------------------------------------
----------------------- ENTITY ------------------------
-------------------------------------------------------  

ENTITY ALU_4bits_tb IS
END ALU_4bits_tb;
 
-------------------------------------------------------
-------------------- ARCHITECTURE ---------------------
------------------------------------------------------- 
 
ARCHITECTURE behavior OF ALU_4bits_tb IS 
	
    COMPONENT ALU_4bits
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         opcode : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         Cout : OUT  std_logic;
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal opcode : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal O : std_logic_vector(3 downto 0);
 
BEGIN
 
   uut: ALU_4bits PORT MAP (
          A => A,
          B => B,
          opcode => opcode,
          cin => cin,
          Cout => Cout,
          O => O
        );

	PROCESS
	BEGIN
		A <= X"2";
		B <= X"D";
		
		--COMMAND 0
		opcode <= X"0";
		-- Operation: NOT A
		
		WAIT FOR 10 NS;

		A <= X"D";
		B <= X"4";
		
		--COMMAND 1
		opcode <= X"1";
		-- Operation: NOT B
		
		WAIT FOR 10 NS;
		A <= X"F";
		B <= X"3";
		
		--COMMAND 2
		opcode <= X"2";
		-- Operation: A AND B
		
		WAIT FOR 10 NS;
		A <= X"4";
		B <= X"C";
		
		--COMMAND 3
		opcode <= X"3";
		-- Operation: A OR B
		
		WAIT FOR 10 NS;
		A <= X"A";
		B <= X"1";
		
		--COMMAND 4
		opcode <= X"4";
		-- Operation: A NAND B
		
		WAIT FOR 10 NS;
		A <= X"D";
		B <= X"4";
		
		--COMMAND 5
		opcode <= X"5";
		-- Operation: A NOR B
		
		WAIT FOR 10 NS;
		A <= X"6";
		B <= X"B";
		
		--COMMAND 6
		opcode <= X"6";
		-- Operation: A XOR B
		
		WAIT FOR 10 NS;
		A <= X"5";
		B <= X"2";
		
		--COMMAND 7
		opcode <= X"7";
		-- Operation: A XNOR B
		
		WAIT FOR 10 NS;
		A <= X"7";
		B <= X"0";
		
		--COMMAND 8
		opcode <= X"8";
		-- Operation: Transfer A
		
		WAIT FOR 10 NS;
		A <= X"2";
		B <= X"7";
		
		--COMMAND 9
		opcode <= X"9";
		-- Operation: Increment A
		
		WAIT FOR 10 NS;
		A <= X"3";
		B <= X"1";
		
		--COMMAND 10
		opcode <= X"A";
		-- Operation: Decrement A
		
		WAIT FOR 10 NS;
		A <= X"8";
		B <= X"5";
		
		--COMMAND 11
		opcode <= X"B";
		-- Operation: Transfer B
		
		WAIT FOR 10 NS;
		A <= X"7";
		B <= X"5";
		
		--COMMAND 12
		opcode <= X"C";
		-- Operation: Increment B
		WAIT FOR 10 NS;
		A <= X"8";
		B <= X"4";
		
		--COMMAND 13
		opcode <= X"D";
		-- Operation: Decrement B
		WAIT FOR 10 NS;
		A <= X"4";
		B <= X"3";
		
		--COMMAND 14
		opcode <= X"E";
		-- Operation: A + B
		
		WAIT FOR 10 NS;
		A <= X"2";
		B <= X"4";
		
		--COMMAND 15
		opcode <= X"F";
		-- Operation: A - B
		
		WAIT FOR 10 NS;

	END PROCESS;

END;

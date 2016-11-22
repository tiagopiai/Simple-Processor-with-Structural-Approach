-------------------------------------------------------
-- Author: Tiago Guido Piai                          --
-- github: tiagopiai											  --
-- email: tiago.piai@hotmail.com							  --
-------------------------------------------------------
-- File: ALU_4bits.vhd                               --
-- Description: Arithmetic Logic Unit with 4 bits    --
--					 data input and 16 operations. Eight  --
--					 logical and eight arithmetical.		  --
-------------------------------------------------------
-- Operations: Opcode Operation							  --
-- 				 0000		NOT A  							  --
--					 0001 	NOT B  							  --
--					 0010 	A AND B							  --
--					 0011 	A OR B 							  --
--					 0100 	A NAND B							  --
--					 0101 	A NOR B							  --
--					 0110 	A XOR B							  --
--					 0111 	A XNOR B							  --
--					 1000 	Transfer A						  --
--					 1001 	Increment A						  --
--					 1010 	Decrement A						  --
--					 1011 	Transfer B						  --
--					 1100		Increment B						  --
--					 1101 	Decrement B						  --
--					 1110 	A + B							     --
--					 1111 	A - B 							  --
-------------------------------------------------------

-------------------------------------------------------
----------------------- LIBRARY -----------------------
-------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

-------------------------------------------------------
----------------------- ENTITY ------------------------
-------------------------------------------------------

ENTITY ALU_4bits IS
PORT(A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		opcode: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		cin: IN STD_LOGIC;
		Cout: OUT STD_LOGIC;
		O: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU_4bits;

-------------------------------------------------------
-------------------- ARCHITECTURE ---------------------
-------------------------------------------------------

ARCHITECTURE func OF ALU_4bits IS
BEGIN

PROCESS(A, B, opcode, cin)
VARIABLE carry: STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
CASE opcode IS 
	WHEN "0000" =>
		O <= NOT A;
		Cout <= '0';
	WHEN "0001" =>
		O <= NOT B;
		Cout <= '0';
	WHEN "0010" =>
		O <= A AND B;
		Cout <= '0';
	WHEN "0011" =>
		O <= A OR B;
		Cout <= '0';
	WHEN "0100" =>
		O <= A NAND B;
		Cout <= '0';
	WHEN "0101" =>
		O <= A NOR B;
		Cout <= '0';
	WHEN "0110" =>
		O <= A XOR B;
		Cout <= '0';
	WHEN "0111" =>
		O <= A XNOR B;
		Cout <= '0';
	WHEN "1000" =>
		O <= A;		
		Cout <= '0';
	WHEN "1001" =>
		carry := '0'&A + '1';	
		O <= carry(3 DOWNTO 0);
		Cout <= carry(4);
	WHEN "1010" =>
		carry := '0'&A - '1';	
		O <= carry(3 DOWNTO 0);
		Cout <= carry(4);	
	WHEN "1011" =>
		O <= B;		
		Cout <= '0';
	WHEN "1100" =>
		carry := '0'&B + '1';	
		O <= carry(3 DOWNTO 0);
		Cout <= carry(4);		
	WHEN "1101" =>
		carry := '0'&B - '1';	
		O <= carry(3 DOWNTO 0);
		Cout <= carry(4);	
	WHEN "1110" =>
		carry := ('0'&A) + ('0'&B);		
		O <= carry(3 DOWNTO 0);
		Cout <= carry(4);
	WHEN "1111" =>
		carry := ('0'&A) + ('0'&(NOT B + '1'));	
		IF(A = B) THEN
			Cout <= '0';
		ELSE
			Cout <= carry(4);
		END IF;
		O <= carry(3 DOWNTO 0);
	WHEN OTHERS =>
		O <= "0000";
		Cout <= '0';
	END CASE;
END PROCESS;
END func;
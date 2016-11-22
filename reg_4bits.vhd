-------------------------------------------------------
-- Author: Tiago Guido Piai                          --
-- github: tiagopiai											  --
-- email: tiago.piai@hotmail.com							  --
-------------------------------------------------------
-- File: reg_4bits.vhd                               --
-- Description: Four bits register with rst, clk and --
--					 enable as control inputs. FlipFlop D -- 
-------------------------------------------------------

-------------------------------------------------------
----------------------- LIBRARY -----------------------
-------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-------------------------------------------------------
----------------------- ENTITY ------------------------
-------------------------------------------------------

ENTITY reg_4bits IS
PORT(Data_in: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		rst, clk, en: IN STD_LOGIC;
		Data_out: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END reg_4bits;

-------------------------------------------------------
-------------------- ARCHITECTURE ---------------------
-------------------------------------------------------

ARCHITECTURE func OF reg_4bits IS
BEGIN

PROCESS(rst, clk, en)
BEGIN
	IF (rst = '1') THEN
		Data_out <= "0000";
	ELSIF (clk'EVENT AND clk = '1') THEN
		IF (en = '1') THEN
			Data_out <= Data_in;
		END IF;
	END IF;
END PROCESS;
END func;
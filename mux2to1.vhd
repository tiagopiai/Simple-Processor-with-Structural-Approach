-------------------------------------------------------
-- Author: Tiago Guido Piai                          --
-- github: tiagopiai											  --
-- email: tiago.piai@hotmail.com							  --
-------------------------------------------------------
-- File: mux2to1.vhd                                 --
-- Description: Multiplexer with two data 4 bits     --
--					 inputs and a one bit selector.       -- 
-------------------------------------------------------

-------------------------------------------------------
----------------------- LIBRARY -----------------------
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-------------------------------------------------------
----------------------- ENTITY ------------------------
-------------------------------------------------------

ENTITY mux2to1 IS
PORT (A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		sel: IN STD_LOGIC;
		O: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END mux2to1;

-------------------------------------------------------
-------------------- ARCHITECTURE ---------------------
-------------------------------------------------------

ARCHITECTURE func OF mux2to1 IS
BEGIN
O <= 	A WHEN sel = '0' ELSE
		B WHEN sel = '1' ELSE
		"0000";
END func;
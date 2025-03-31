-- LEDController.vhd
-- 2025.03.09
--
-- This SCOMP peripheral implements LED dimming on 10 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY LEDController IS
PORT(
    CLK         : IN  STD_LOGIC;                            -- System clock for PWM timing
    CS          : IN  STD_LOGIC;                            -- Chip select from SCOMP
    WRITE_EN    : IN  STD_LOGIC;                            -- Write enable signal
    RESETN      : IN  STD_LOGIC;                            -- Active-low reset
    IO_DATA     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);        -- Data bus for register writes
    LEDs        : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)          -- 10 LED outputs (dimming via PWM)
);
END LEDController;

ARCHITECTURE Behavioral OF LEDController IS

    -- Brightness register (8-bit)
    SIGNAL brightness_reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');

    -- PWM counter (8-bit)
    SIGNAL pwm_counter : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
    SIGNAL pwm_signal  : STD_LOGIC;

BEGIN

    Reg_Update: PROCESS(CLK, RESETN)
    BEGIN
        IF RESETN = '0' THEN
            brightness_reg <= (others => '0');    -- default brightness: off
        ELSIF RISING_EDGE(CLK) THEN
            IF CS = '1' AND WRITE_EN = '1' THEN
                brightness_reg <= IO_DATA(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS Reg_Update;

 
    PWM_Process: PROCESS(CLK, RESETN)
    BEGIN
        IF RESETN = '0' THEN
            pwm_counter <= (others => '0');
        ELSIF RISING_EDGE(CLK) THEN
            pwm_counter <= pwm_counter + 1;
        END IF;
    END PROCESS PWM_Process;

    -- Generate PWM signal: high when pwm_counter < brightness_reg.
    pwm_signal <= '1' WHEN (pwm_counter < brightness_reg) ELSE '0';

   
    LEDs <= (others => pwm_signal);

END Behavioral;
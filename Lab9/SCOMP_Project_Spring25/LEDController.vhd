-- LEDController.vhd
-- 2025.03.09
--
-- This SCOMP peripheral implements LED dimming on 10 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

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


    SIGNAL brightness_reg : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL on_leds	: STD_LOGIC_VECTOR(9 DOWNTO 0 );

    SIGNAL pwm_counter : STD_LOGIC_VECTOR(5 DOWNTO 0) := (others => '0');
    SIGNAL pwm_signal  : STD_LOGIC;

BEGIN

    Reg_Update: PROCESS(CLK, RESETN)
    BEGIN
        IF RESETN = '0' THEN
            brightness_reg <= (others => '0');    -- default brightness: off
        ELSIF RISING_EDGE(CLK) THEN
            IF WRITE_EN = '1' AND CS='1' THEN
                brightness_reg <= IO_DATA(15 DOWNTO 10);
					 on_leds <= IO_DATA(9 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS Reg_Update;

 
    PWM_Process: PROCESS(CLK, RESETN)
    BEGIN
        IF RESETN = '0' THEN
            pwm_counter <= "000000";
        ELSIF RISING_EDGE(CLK) THEN
				IF (pwm_counter = "111111") THEN
					pwm_counter <= "000000";
				ELSIF (unsigned(pwm_counter) >= unsigned(brightness_reg)) THEN
					LEDs <= "0000000000";
					pwm_counter <= std_logic_vector( unsigned(pwm_counter) + 1 );
				ELSE
					LEDs <= on_leds;
					pwm_counter <= std_logic_vector( unsigned(pwm_counter) + 1 );
				END IF;
        END IF;
    END PROCESS PWM_Process;
	 

END Behavioral;
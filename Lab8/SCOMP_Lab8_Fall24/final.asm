ORG 0

START:
  IN Switch

  JPOS START
  JNEG START
  

NEXT_STEP:
  IN Timer
  STORE startTime
  
COUNT_TIMER:
  IN Timer
  STORE endTime
  
  LOAD endTime
  SUB startTime
  SUB One
  JZERO COUNT_TIMER
  JNEG COUNT_TIMER
  
SEND_OUT:
    LOAD BRIGHTNESS
    ADDI 1
    STORE BRIGHTNESS
    
    LOAD BRIGHTNESS
    SUB Sixtythree
    
    JZERO ADD_LED


OUT_LEDS:
    LOAD BRIGHTNESS
    OUT Display
    
    LOAD BRIGHTNESS
    
    SHIFT 10
    ADD LEDs
    STORE COMBINED
    
    LOAD COMBINED
    OUT &H020
    
    LOAD LEDs
    SUB MAX_LEDS_ON
    JNEG NOT_MAX
    
    LOAD BRIGHTNESS
    SUB MAX_BRIGHTNESS
    JNEG NOT_MAX
    
    JZERO RESTART
    
NOT_MAX:
    JPOS NEXT_STEP
    JNEG NEXT_STEP
    
    
RESTART:
	AND Zero
    STORE GlobalCounter
    STORE BRIGHTNESS
    
    LOAD One
    STORE ON_LEDs
    STORE LEDs
    STORE COMBINED
    
    JUMP START
    
    
    
    
ADD_LED:
    
    LOAD LEDs
    SHIFT 1
    ADDI 1
    STORE LEDs
    
    LOAD ON_LEDs
    ADDI 1
    STORE ON_LEDs
    
    LOAD Zero
    STORE BRIGHTNESS
    
    JUMP OUT_LEDs
   
    
    
  


HALT:
  JUMP HALT

startTime:    DW 0
endTime:    DW 0

Reset_Six:	DW 6
Zero:        DW 0
One:		DW 1
Six:        DW 6
Ten:        DW 10
Sixty:		DW 60
Sixtythree:	DW 63
ON_LEDs:    DW 1

LEDs:    DW &B0000000001
BRIGHTNESS:    DW &B000000
COMBINED: DW &B0000000000000001

MAX_BRIGHTNESS: DW &B0111110
MAX_LEDS_ON: DW &B01111111111

GlobalCounter: DW 0


Timer:     EQU 002
Switch:        EQU 000
Peripheral: EQU &H20
Display:	EQU 004
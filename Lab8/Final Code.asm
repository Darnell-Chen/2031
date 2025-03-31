; IODemo.asm
; Produces a "bouncing" animation on the LEDs.
; The LED pattern is initialized with the switch state.

ORG 0

START:
  AND 0
  STORE Random
  STORE Score
  STORE Answer
  STORE FLSB_Temp
  OUT HEX1

ROUND:

  IN 	Switches
  OUT 	LEDs
  JPOS 	ROUND
  JNEG	ROUND
  JZERO  NEWGETNUMBER
  
NUMBERFOUND:
  IN Timer
  STORE TimerStart
  
  LOAD Random
  AND ModMask
  STORE Random
  JZERO ISZERO
 
NOTZERO:
  LOAD Random
  CALL FindLowestSetBit
  STORE Answer
  
POLLANSWER:
  IN Switches
  ADDI -512
  STORE Input
  JZERO POLLANSWER
  
  LOAD Input
  CALL FindLowestSetBit
  XOR All
  ADDI 1
  ADD Answer
  JZERO CORRECT
  JNEG START
  JPOS START

CORRECT:
    IN Timer
    SUB TimerStart
    STORE TimeTaken
    
    AND 0
    ADDI 20
    SUB TimeTaken
    
	JNEG ROUNDEND
    
    ADD SCORE
    
    STORE Score
    LOAD Score
    OUT HEX1
 
ROUNDEND:
    AND 0
    STORE Random
    STORE Answer
    STORE Input
    JUMP ROUND
  

NEWGETNUMBER:
	AND 0
    STORE Random
    LOAD Random
    OUT HEX0
GETNUMBER:
	IN Switches
    OUT LEDs
    ADD	NBit9
    JPOS INCREMENTRANDOM
    JNEG INCREMENTRANDOM
    JUMP NUMBERFOUND
    
INCREMENTRANDOM:
	LOAD Random
    ADDI 1
    STORE Random
	LOAD Random
    OUT HEX0
    JUMP GETNUMBER
    

ISZERO:
	AND 0
    ADDI 511
    STORE Random
    JUMP NOTZERO

END:
  LOAD FLSB_Temp
  JUMP END


Random:	   	DW 0
Answer:		DW 0
Score:		DW 0
Input: 		DW 0
TimerStart: DW 0
TimeTaken: 	DW 0

; Useful values
All: 	   DW &HFFFF
Bit0:      DW &B0000000001
Bit9:      DW &B1000000000
NBit9:	   DW -512
ModMask:   DW &B0111111111


; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005


FindLowestSetBit:
    STORE AC_VAL
    
    LOAD ZERO
    STORE FLSB_Temp
    
    LOAD AC_VAL
	AND ALL_BITS
    JZERO SET_NEGATIVE
    
AFTER_NEGATIVE:
    JPOS CHECK
DONE:
    LOAD FLSB_Temp
    RETURN

CHECK:
    LOAD AC_VAL
    AND CLEAR_HIGHER
    
    JPOS DONE
    CALL INCREMENT
    JUMP CHECK
    

INCREMENT:
    LOAD AC_VAL
    SHIFT -1
    STORE AC_VAL
	LOAD FLSB_Temp
    ADDI 1
    STORE FLSB_Temp
    RETURN

SET_NEGATIVE:
	LOAD FLSB_Temp
    ADDI -1
    STORE FLSB_Temp
    JUMP AFTER_NEGATIVE



ZERO: DW 0
START_AC_VAL: DW 10496
AC_VAL: DW 0
ALL_BITS: DW &HFFFF
CLEAR_HIGHER: DW 1
FLSB_Temp: DW 0
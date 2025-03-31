; IODemo.asm
; Produces a "bouncing" animation on the LEDs.
; The LED pattern is initialized with the switch state.

ORG 0
Get_Again:
	; Get and store the switch values
	IN     	Switches
 	STORE 	InitialInput
    STORE currentInput
    
    LOAD	Zero
    Store 	Index
    Store 	Counter
    
    LOAD 	InitialInput
    
    JUMP 	Check_Switches

Continue:
	OUT    LEDs
	STORE  Pattern
	
Left:
	; Slow down the loop so humans can watch it.
	CALL   Delay

	; Check if the left place is 1 and if so, switch direction
	LOAD   Pattern
	AND    Bit9         ; bit mask
	JPOS   Right        ; bit9 is 1; go right
	
	LOAD   Pattern
	SHIFT  1
	STORE  Pattern
	OUT    LEDs

	JUMP   Left
	
Right:
	; Slow down the loop so humans can watch it.
	CALL   Delay

	; Check if the right place is 1 and if so, switch direction
	LOAD   Pattern
	AND    Bit0         ; bit mask
	JPOS   Left         ; bit0 is 1; go left
	
	LOAD   Pattern
	SHIFT  -1
	STORE  Pattern
	OUT    LEDs
	
	JUMP   Right
	
; To make things happen on a human timescale, the timer is
; used to delay for half a second.
Delay:
	OUT    Timer
WaitingLoop:
	IN     Timer
	ADDI   -5
	JNEG   WaitingLoop
	RETURN


Check_Switches:
	LOAD currentInput
    JZERO Clear_Return
    AND	Bit0
    JPOS Increment_Counter
    CALL SHIFT_RIGHT
    JZERO Check_Switches
    

Increment_Counter:
	LOAD Counter
    ADDI 1
    STORE Counter
    CALL SHIFT_RIGHT
    JUMP Check_Switches

Clear_Return:
	LOAD Counter
    ADDI -2
    JPOS Get_Again
    LOAD InitialInput
    JUMP Continue

SHIFT_RIGHT:
	LOAD currentInput
    SHIFT -1
    STORE currentInput
    SHIFT 1
    AND Bit0
    RETURN

InitialInput: 	DW 0
currentInput: 	DW 0
Index:			DW 0
Counter:		DW 0
Zero:			DW 0

; Variables
Pattern:   DW 0	

; Useful values
Bit0:      DW &B0000000001
Bit9:      DW &B1000000000

; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005

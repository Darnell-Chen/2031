; SimpleDemo.asm
; Tests basic instructions in SCOMP

ORG 0
LOADI 	20
SUB		A
STORE 	&H20

jump:
JUMP jump

ORG 25
A: 	DW 	69
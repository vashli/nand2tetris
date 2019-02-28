 // This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// R2 = 0 R2 += max(R0, R1) for i in range(min(R0, R1))

	@R2
	M=0 // R2 = 0
	@R0
	D=M
	@R1
	D=D-M	// D = R0 - R1
	@IFGREATER
	D;JGT

	// if R0 <= R1
	@R0
	D=M
	@k		// min(R0, R1)
	M=D

	@R1
	D=M
	@toadd  // max(R0, R1)
	M=D

(LOOP)
	@k
	D=M // D = k

	@END
	D;JLE // if k <= 0: goto END

	@toadd
	D=M 

	@R2
	M=D+M // R2 += toadd

	@1
	D=A
	@k
	M=M-D

	@LOOP
	0;JMP 
	
(IFGREATER)	
	// if R0 > R1
	@R1
	D=M
	@k		// min(R0, R1)
	M=D

	@R0
	D=M
	@toadd  // max(R0, R1)
	M=D

	@LOOP
	0;JMP

(END)
	@END
	0;JMP
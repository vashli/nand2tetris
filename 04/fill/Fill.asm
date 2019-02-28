(LOOP)
	@KBD
	D=M

	@LOOP3INIT // if keyPressed goto LOOP3
	D;JEQ

	@LOOP2INIT // else goto LOOP2
	0;JMP

(LOOP3INIT)
	@8191
	D=A
	@i
	M=D

(LOOP3)
	@i
	D=M //D = i

	@LOOP
	D;JLT // if i <= 0: goto LOOP
	
	@i
	D=M
	@SCREEN
	A=D+A //addr(SCREEN) + i
	M = 0

	@1 
	D=A
	@i
	M=M-D //i--

	@LOOP3
	0;JMP

(LOOP2INIT)
	@8191
	D=A
	@i
	M=D

(LOOP2)
	@i
	D=M 	// D = i

	@LOOP
	D;JLT 	// if i <= 0: goto LOOP

	@i
	D=M
	@SCREEN
	A=D+A //addr(SCREEN) + i
	M = -1

	@1 
	D=A
	@i
	M=M-D 	//i--

	@LOOP2
	0;JMP

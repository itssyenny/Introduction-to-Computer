// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
	@SCREEN
	D = A	//D = Memory[SCREEN]
	@addr
	M = D	//Memory[addr] = D
(LOOP)
	
	@KBD
	
	D = M	//D = MEMORY[KBD]

	@SETWHITE
	
	D;JLE	//if(d <= 0) goto SETWHITE
	
	
(SETBLACK)

	@addr
	D = M	//D = Memory[addr]
	@KBD
	D = D - A	//D = Memory[addr]-KBD
	@LOOP
	D;JGE	//if(Memory[addr]-KBD >= 0) go to LOOP
	
	@addr
	A = M	//A = Memory[addr]
        
	M = -1	//memory[A] = -1
        

	@addr
        
	M = M+1
        
	
	@LOOP
	0;JMP

(SETWHITE)

	@addr
	D = M	//D= Memory[addr]
	@SCREEN
	D = D - A	//D = D - SCREEN
	@LOOP
	D;JLT 	//if(Memory[addr]-SCREEN < 0) go to LOOP
	
	@addr                     
	A = M	//A = Memory[addr]
        
	M = 0	//memory[A] = 0
        

	@addr
        
	M = M-1
   //Memory[addr] = Memory[addr] -1      

	@LOOP
	0;JMP

/********************************************************************************
* Lab 3 - Part 2: Poll and add switches when key is pressed
********************************************************************************/
.text /* executable code follows */
.global _start
_start:
/* set up sp and fp */
	movia 	sp, 0x007FFFFC			# stack starts from largest memory address 
	mov 		fp, sp


/* initialize base addresses of parallel ports */
	movia r15, 0x10000040 	/* SW slider switch base address */
	movia r16, 0x10000000 	/* red LED base address */
	movia r17, 0x10000050	/* pushbutton KEY load */
	movia r18, 0x10000010 	/* green LED base address */
	movia r19, 0x1000005C	/* edgecapture */
	movia r20, 0x10000020	/* HEX3_HEX0 Base addy */
	movia r21, 0x10000030	/* HEX7_HEX4 Base addy */
	movia r14, SEG_TBL		/* Seg Table addy */

	
DO_DISPLAY:
	ldwio r5, 0(r19)		/* load edgecapture */
	beq	  r5, zero, DO_DISPLAY	/* loop until pressed */
	stwio zero, 0(r19)		/*clear the register */
	
	ldwio r4, 0(r15)		/* load input from slider switches */
	stwio r4, 0(r18) 		/* write to green LEDs */

/*add the current number to the total*/
	add  r3, r4, r2			/* add the current switches, store in r3*/
	stwio r3, 0(r16) 		/* write total to red LEDs */
	mov	  r2, r3			/* store current total */
	
	mov	  r6, r14
	add	  r6, r2, r6		/*get the right offset*/
	ldb	  r6, 0(r6)
	stwio r6, 0(r20)		/*put value to hex */
	
	ldb	  r6, 0(r14)		/* reset table pointer */
	
	br	DO_DISPLAY
	
.org	0x800
SEG_TBL:
.byte		0x3F	/*0*/
.byte		0x60	/*1*/
.byte		0x5B	/*2*/
.byte		0x4F	/*3*/
.byte		0x66	/*4*/
.byte		0x6D	/*5*/
.byte		0x7D	/*6*/
.byte		0x70	/*7*/
.byte		0x7F	/*8*/
.byte		0x67	/*9*/
.byte		0x77	/*A*/
.byte		0x7C	/*B*/
.byte		0x39	/*C*/
.byte		0x5E	/*D*/
.byte		0x79	/*E*/
.byte		0x71	/*F*/
.end
	



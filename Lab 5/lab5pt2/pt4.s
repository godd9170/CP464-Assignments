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
	movia r15, 0x00005040 	/* SW slider switch base address */
	movia r16, 0x00005020 	/* red LED base address */
	movia r17, 0x00005000	/* pushbutton KEY load */
	movia r18, 0x00005030 	/* green LED base address */
	movia r19, 0x0000500C	/* edgecapture */
	movia r20, 0x00005010	/* HEX3_HEX0 Base addy */
	/*movia r21, 0x00000030	 HEX7_HEX4 Base addy */
	movia r14, SEG_TBL		/* Seg Table addy */

	
DO_DISPLAY:
	movia r8, 0xffffffff
	stwio r8, 0(r20)		/* push the buffer containing hex digits to the HEX0-3 */
	ldwio r5, 0(r19)		/* load edgecapture */
	beq	  r5, zero, DO_DISPLAY	/* loop until pressed */
	stwio zero, 0(r19)		/*clear the register */
	
	ldwio r4, 0(r15)		/* load input from slider switches */
	stwio r4, 0(r18) 		/* write to green LEDs */

/* add the current number to the total */
	add  r3, r4, r2			/* add the current switches, store in r3 */
	stwio r3, 0(r16) 		/* write total to red LEDs */
	mov	  r2, r3			/* store current total */

/* 1st digit */
	movia r7, 0x00000000	/* Clear r7 */
	movia r6, 0x00000000	/* Clear r6 */
	mov	  r6, r14			/* put the table address into r6 */
	andi  r7, r3, 0x000F	/* mask out higher bits */
	add	  r6, r7, r6		/* get the table offset */
	ldb	  r6, 0(r6)			/* load the value at the table + offset address */
	mov	  r8, r6			/* r8 is the buffer */

	
	
/* 2nd digit */
	movia r7, 0x00000000	/* Clear r7 */
	srai  r3, r3, 4			/* shift 2nd digit to low nibble */
	mov	  r6, r14			/* put the table address into r6 */
	andi  r7, r3, 0x000F	/* mask out higher bits */
	add	  r6, r7, r6		/* get the table offset */
	ldb	  r6, 0(r6)			/* load the value at the table + offset address */
	slli  r7, r6, 8			/* push hex digit into r7 and slide left to second digit */
	or	  r8, r8, r7		/* or new digit into buffer */

	
/* 3rd digit */
	movia r7, 0x00000000	/* Clear r7 */
	srai  r3, r3, 4			/* shift 3rd digit to low nibble */
	mov	  r6, r14			/* put the table address into r6 */
	andi  r7, r3, 0x000F	/* mask out higher bits */
	add	  r6, r7, r6		/* get the table offset */
	ldb	  r6, 0(r6)			/* load the value at the table + offset address */
	slli  r7, r6, 16		/* push hex digit into r7 and slide left to 3rd digit */
	or	  r8, r8, r7		/* or new digit into buffer */

	
/* 4th digit */
	movia r7, 0x00000000	/* Clear r7 */
	srai  r3, r3, 4			/* shift 4th digit to low nibble */
	mov	  r6, r14			/* put the table address into r6 */
	andi  r7, r3, 0x000F	/* mask out higher bits */
	add	  r6, r7, r6		/* get the table offset */
	ldb	  r6, 0(r6)			/* load the value at the table + offset address */
	slli  r7, r6, 24		/* push hex digit into r7 and slide left to 4th digit */
	or	  r8, r8, r7		/* or new digit into buffer */

	
/* Push to Hex */
	stwio r8, 0(r20)		/* push the buffer containing hex digits to the HEX0-3 */
	
	
	br	DO_DISPLAY
	
.org	0x800
SEG_TBL:
.byte		0x3F	/*0*/
.byte		0x06	/*1*/
.byte		0x5B	/*2*/
.byte		0x4F	/*3*/
.byte		0x66	/*4*/
.byte		0x6D	/*5*/
.byte		0x7D	/*6*/
.byte		0x07	/*7*/
.byte		0x7F	/*8*/
.byte		0x67	/*9*/
.byte		0x77	/*A*/
.byte		0x7C	/*B*/
.byte		0x39	/*C*/
.byte		0x5E	/*D*/
.byte		0x79	/*E*/
.byte		0x71	/*F*/
.end
	


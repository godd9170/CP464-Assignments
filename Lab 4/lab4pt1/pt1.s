/********************************************************************************
* Lab 4 - Part 1: interrupt and add switches when key is pressed
********************************************************************************/
.text /* executable code follows */
.global _start
_start:
	movia	r2, MAIN
	jmp	r2				/*skip over exception to rest of program*/

.org	0x20
EXCEPTION:
	rdctl et, ipending	 /* read the ipending register */
	beq	  et, zero, SOFT		/*check if software */
	andi  et, et, 0x00000002 /* mask out button flag */
	beq   et, zero, SKIP	/*check if hardware interrupt */	
	call  DO_DISPLAY	/*go to the DO_DISPLAY function*/
SKIP:
	subi ea, ea, 0x04	/* ensure exception return address is back to the instruction being executed at time of */
SOFT:
	eret				/*return from exception*/



MAIN:	
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

/*set up interrupt*/
	movia	r3, 0xe		/*get binary 1110 into r3 to enable 3 button interrupts*/
	stwio r3,8(r17)  	/* interrupts on buttons 1,2, and 3 */
	
	movia r2,0x02	
	wrctl ienable,r2   /* Enable bit 5 - button interrupt on Processor */

	movia r2,1
	wrctl status,r2   /* Enable global Interrupts on Processor */
	
WAITING:
	br	  WAITING  		/*tight loop until interrupt */
	
DO_DISPLAY:
	
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
	
	ret
	
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
	



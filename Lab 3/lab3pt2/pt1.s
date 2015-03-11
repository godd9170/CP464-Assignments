/********************************************************************************
* Lab 3 - Part 2: Echo's switches to green LEDs, displays cumulative sum on the 
* red LEDs
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
	movia r18, 0x10000010 	/* green LED base address */

DO_DISPLAY:  
	ldwio r4, 0(r15)		/* load input from slider switches */
	stwio r4, 0(r18) 		/* write to green LEDs */

/*add the current number to the total*/
	add  r3, r4, r2			/* add the current switches, store in r3*/
	stwio r3, 0(r16) 		/* write total to red LEDs */
	mov	  r2, r3			/* store current total */
	
	br DO_DISPLAY

.org	0x800
TOTAL:
	.skip	4			  /* The cumulative total spot */

	.end

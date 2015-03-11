/* Program that finds the largest number in a list of integers	    */

.equ LIST, 0x800		  /* Starting address of the list		    */

.global _start
_start:
	/* set up sp and fp */
	movia 	sp, 0x007FFFFC			# stack starts from largest memory address 
	mov 		fp, sp

	movia	r4, LIST	  /* r4 points to the start of the list	    */
	ldw	r5, 4(r4)	  /* r5 is a counter, initialize it with n    */
	addi	r6, r4, 8	  /* r6 points to the first number		    */
 	ldw	r7, (r6)	  /* r7 holds the largest number found so far */
	
	subi		sp, sp, 24		# reserve space on the stack 
	/* save registers */
	stw		ra, 0(sp)
	stw		fp, 4(sp)
	stw 		r4, 8(sp)	/* save beginning of LIST */
	stw 		r5, 12(sp)  /* save counter */
	stw 		r6, 16(sp)  /* save pointer to first number */
	stw 		r7, 20(sp)  /* save largest number holder */
	addi		fp, sp, 0
	
	/*Clear registers (to check stack functionality)*/
	movia	r4, 0x00000000
	movia	r5, 0x00000000
	movia	r6, 0x00000000
	movia	r7, 0x00000000
	
	call	GET_LARGEST



STOP:	
	br	STOP		  /* Remain here if done			    */
	
GET_LARGEST:	
	/* store return address */
	stw		ra, 0(sp)
	/* load registers */
	ldw		fp, 4(sp)
	ldw 		r4, 8(sp)    /* load beginning of LIST */
	ldw 		r5, 12(sp)   /* load counter */
	ldw 		r6, 16(sp)   /* load pointer to first number */
	ldw 		r7, 20(sp)   /* load largest number holder */
LOOP:
	subi	r5, r5, 1	  /* Decrement the counter 			    */
	beq	r5, r0, DONE  /* Finished if r5 is equal to 0		    */
	addi	r6, r6, 4	  /* Increment the list pointer		    */
	ldw	r8, (r6)	  /* Get the next number			    */
	bge	r7, r8, LOOP  /* Check if larger number found		    */
	add	r7, r8, r0	  /* Update the largest number found	    */
	br	LOOP
DONE:
	stw	r7, (r4)	  /* Store the largest number into RESULT	    */
	ldw	ra, 0(sp) 		/* load the return address */
	ret

.org	0x800
RESULT:
.skip	4			  /* Space for the largest number found	    */
N:
.word 7			  /* Number of entries in the list		    */
NUMBERS:
.word	4, 5, 3, 6, 1, 8, 2	/* Numbers in the list */

.end

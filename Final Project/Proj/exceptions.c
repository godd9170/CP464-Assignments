#include "nios2_ctrl_reg_macros.h"
/* Code needed to implement the reset functionality */
void the_reset (void)__attribute__((section(".reset")));
void the_reset (void)
{
	asm ("movia r2, main");	// call the C main program
	asm ("jmp r2");		  	
}
 
/* Code needed to deal with exceptions */
void the_exception (void)__attribute__((section(".exceptions")));
void the_exception (void)
{
	asm ("subi sp, sp, 4");		// make room on stack
	asm ("stw et, (sp)");	  	// to save exception temp reg
	asm ("rdctl et, ipending");	// read the ipending register 	
	asm ("beq et, r0, SKIP_EA_DEC"); // skip if interrupt is not external 
	asm ("subi ea, ea, 4");		//  decrement ea by on instruction
	asm ("SKIP_EA_DEC:");

	/*register save*/
	asm ( "stw r1, 4(sp)" ); 
	asm ( "stw r2, 8(sp)" );
	asm ( "stw r3, 12(sp)" );
	asm ( "stw r4, 16(sp)" );
	asm ( "stw r5, 20(sp)" );
	asm ( "stw r6, 24(sp)" );
	asm ( "stw r7, 28(sp)" );
	asm ( "stw r8, 32(sp)" );
	asm ( "stw r9, 36(sp)" );
	asm ( "stw r10, 40(sp)" );
	asm ( "stw r11, 44(sp)" );
	asm ( "stw r12, 48(sp)" );
	asm ( "stw r13, 52(sp)" );
	asm ( "stw r14, 56(sp)" );
	asm ( "stw r15, 60(sp)" );
	asm ( "stw r16, 64(sp)" );
	asm ( "stw r17, 68(sp)" );
	asm ( "stw r18, 72(sp)" );
	asm ( "stw r19, 76(sp)" );
	asm ( "stw r20, 80(sp)" );
	asm ( "stw r21, 84(sp)" );
	asm ( "stw r22, 88(sp)" );
	asm ( "stw r23, 92(sp)" );
	//skip et
	asm ( "stw r25, 100(sp)" ); // r25 = bt (skip r24 = et, because it was saved above)
	asm ( "stw r26, 104(sp)" );
	//skip stack pointer
	asm ( "stw r28, 112(sp)" ); // r28 = fp
	asm ( "stw r29, 116(sp)" ); // r29 = ea
	asm ( "stw r30, 120(sp)" ); // r30 = ba
	asm ( "stw r31, 124(sp)" ); // r31 = ra
	asm ( "addi fp, sp, 128" );

	
	asm ("call INT_HANDLER");		//Exception handler

	/*register restore*/
	
	asm ( "ldw r1, 4(sp)" ); // restore all registers
	asm ( "ldw r2, 8(sp)" );
	asm ( "ldw r3, 12(sp)" );
	asm ( "ldw r4, 16(sp)" );
	asm ( "ldw r5, 20(sp)" );
	asm ( "ldw r6, 24(sp)" );
	asm ( "ldw r7, 28(sp)" );
	asm ( "ldw r8, 32(sp)" );
	asm ( "ldw r9, 36(sp)" );
	asm ( "ldw r10, 40(sp)" );
	asm ( "ldw r11, 44(sp)" );
	asm ( "ldw r12, 48(sp)" );
	asm ( "ldw r13, 52(sp)" );
	asm ( "ldw r14, 56(sp)" );
	asm ( "ldw r15, 60(sp)" );
	asm ( "ldw r16, 64(sp)" );
	asm ( "ldw r17, 68(sp)" );
	asm ( "ldw r18, 72(sp)" );
	asm ( "ldw r19, 76(sp)" );
	asm ( "ldw r20, 80(sp)" );
	asm ( "ldw r21, 84(sp)" );
	asm ( "ldw r22, 88(sp)" );
	asm ( "ldw r23, 92(sp)" );
	//skip et
	asm ( "ldw r25, 100(sp)" ); // r25 = bt
	asm ( "ldw r26, 104(sp)" ); // r26 = gp
	//skip stack pointer
	asm ( "ldw r28, 112(sp)" ); // r28 = fp
	asm ( "ldw r29, 116(sp)" ); // r29 = ea
	asm ( "ldw r30, 120(sp)" ); // r30 = ba
	asm ( "ldw r31, 124(sp)" ); // r31 = ra
	
	asm ("eret");		    /* Return from exception. */
}


/*
* Interrupt functionality. Determines if the pushbutton was the cause
* of the interrupt. If so, it calls the interrupt functionality (hex_update).
*/
void INT_HANDLER()
{
  int ipending;
  NIOS2_READ_IPENDING(ipending);	//get the value of ipending at interrupt
  
	if( ipending & 0x64 )		//was a push button interrupt.
	{
		handle_audio_interrupt();
	}
	return;
}
/* main.c
 * aggregating total displayed in hex on 7 segment displays, entered via the switches
 * written for part 5 - lab 2 CP464
 * written by Henry Goddard
 * 1/19/15
 */
  
#include <stdio.h>
  
int main()
{
	/*define all of the hardware memory locations*/
	volatile int *switches = (int *) 0x10000040;
	volatile int *rLEDs = (int *) 0x10000000;
	volatile int *buttons = (int *) 0x10000050;
	volatile int *gLEDs = (int *) 0x10000010;
	volatile int *edge = (int *) 0x1000005C;
	volatile int *HEX1 = (int *) 0x10000020;
	int hexDigits[16] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x70,0x7F,0x67,0x77,0x7C,0x39,0x5E,0x79,0x71};

	int buffer = 0x00000000; /*holder for the bytes to be put into the hex locations */
	int	temp = 0x00000000;
	int counter = 4;	     /*loop counter to ensure 4 nibbles*/
	int value = *switches;	 /*get the value entered into the switches*/
	int mask = 0xF;
	int total = 0x00000000;				/*store the total that is to be aggregated each button press*/
	
	
	while(1) {					/*poll*/
		*rLEDs = *switches;		/*mirror switches to LEDs*/
		if(*edge != 0) {			/*check for button*/
			*edge = 0x0;		/*reset edge capture */
			value = *switches;	 /*get the value entered into the switches*/
			total += value;		/*add input value to total*/
			while(counter--) {
				temp = total >> (counter * 4);	/*get value into low nibble*/
				temp = temp & mask;		/*get the value held in the nibble */
				temp = *(hexDigits + temp) << (counter * 8);		/* convert temp to a 7seg interpretation and shift it back to it's proper location in buffer */
				buffer = temp | buffer;				/*or temp into buffer*/
			} /*-end while-*/
			
			*HEX1 = buffer;						/*put the value from buffer into the 7segs*/
			buffer = 0x00000000;		/*clear buffer */
			counter = 4;			/*reset counter*/
		}
	}/*-end poll-*/
}
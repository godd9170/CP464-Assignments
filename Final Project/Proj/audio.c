/* audio.c
 * Record and playback audio
 * written by Henry Goddard
 * 2/5/15
 */
 
 /* globals */
#include "VGA.h"
#define BUF_SIZE 23000			// 
#define BUF_THRESHOLD 96		// 75% of 128 word buffer
#define SCREEN_BUFFER 76800


void handle_audio_interrupt() {
	volatile int *audio_ptr = (int *) 0x10003040;	// audio port address
	
	/* used for audio record/playback */
	int fifospace, leftdata, rightdata,y1,dummy;
	int buffer_index = 0;
	int x0 = 0;
	int y0 = 120;
	
	printf("yep");
	
	fifospace = *(audio_ptr + 1);
	
	while (buffer_index < BUF_SIZE){
		
		if (x0 == 320)
			x0 = 0;
		
		y1 =  120 + (*(audio_ptr + 2) >> 17); //knock off the bottom 16 bits
		dummy = *(audio_ptr + 3);
		
		
		draw_line(x0,0,x0,240,0xffff); //clear line from before
		draw_line(x0,y0,x0,y1+1,0xf800);
		
		fifospace = *(audio_ptr + 1); //update fifospace

		buffer_index++;
		x0 = x0 + 1;
	}
	*audio_ptr &= ~(1 << 2);  //clear enable audio read interrupts

}


int * record_audio() {
	volatile int *audio_ptr = (int *) 0x10003040;	// audio port address

	/* used for audio record/playback */
	int fifospace, leftdata, rightdata;
	static int left_buffer[SCREEN_BUFFER];
	int right_buffer[SCREEN_BUFFER];
	int buffer_index = 0;
	float intensity = 0;
	int y = 0;
	
	fifospace = *(audio_ptr + 1);	 		// update the audio port fifospace register
		if ( (fifospace & 0x000000FF) > BUF_THRESHOLD )  //see if there is room to record
		{
			while ( (fifospace & 0x000000FF) && (buffer_index < SCREEN_BUFFER) )
			{
				left_buffer[buffer_index] = *(audio_ptr + 2);  //put the value in the left channel into memory
				right_buffer[buffer_index] = *(audio_ptr + 3);  //put the value in the right channel into memory
				
			
				buffer_index = buffer_index + 1; //increment buffer index 
				
				//check if the buffer is full
				if (buffer_index == SCREEN_BUFFER)
					{
						printf("done");
					}
				fifospace = *(audio_ptr + 1);	// update audio port fifospace register
			}
		}
	// clear audio-in FIFO
		*(audio_ptr) = 0x4;
		*(audio_ptr) = 0x0;
	return	left_buffer;
}
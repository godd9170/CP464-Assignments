/* audio.c
 * Record and playback audio
 * written by Henry Goddard
 * 2/5/15
 */
 
 /* globals */
#define BUF_SIZE 23999			// 
#define BUF_THRESHOLD 96		// 75% of 128 word buffer
#include "c_note.h"		//c 
#include "b_note.h"		//b 
#include "a_note.h"		//a 
#include "d_note.h"		//d 


int main()
{
	
	volatile int *audio_ptr = (int *) 0x10003040;	// audio port address
	volatile int *HEX_ptr = (int *) 0x10000020;  //hex displays
	volatile int *HEX2_ptr = (int *) 0x10000030;  //hex displays
	volatile int *switches_ptr = (int *) 0x10000040; //switches

	/* used for audio record/playback */
	int fifospace, leftdata, rightdata;
	int b_flag = 0, a_flag = 0, d_flag = 0, buffer_index = 0, counter = 0;
	int left_buffer[BUF_SIZE];
	int right_buffer[BUF_SIZE];

	*(HEX_ptr) = 0x00000000;   /*display '0000'*/

	/*loop indefinitely looking for the play/record buttons*/

	while(1)
	{
		
		key_check ( &b_flag, &a_flag, &d_flag, &buffer_index );
		/*record mode*/
		if(b_flag)
		{
			*(HEX_ptr) = 0x7938776e;   /*display 'PLAY'*/
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
		
			if ( (fifospace & 0x00ff0000) > BUF_THRESHOLD )  //see if there is rroom to play out
			{	
				while ( (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE) )
				{


					*(audio_ptr + 2) = b_note[counter];
					*(audio_ptr + 3) = b_note[counter];

					buffer_index = buffer_index + 1; //increment buffer index 	
					counter = counter + 1;
					

					if (buffer_index == BUF_SIZE)
					{
						// done playback
						b_flag = 0;
						*(HEX_ptr) = 0x00000000;   /*display '0000'*/	
						counter = 0;
					}
					fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
					
				}

				
				
			}
		}
		/*a Note*/
		else if(a_flag)
		{
			*(HEX_ptr) = 0x7938776e;   /*display 'PLAY'*/
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
		
			if ( (fifospace & 0x00ff0000) > BUF_THRESHOLD )  //see if there is rroom to play out
			{	
				while ( (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE) )
				{


					*(audio_ptr + 2) = a_note[counter];
					*(audio_ptr + 3) = a_note[counter];

					
					counter = counter + 1;
					buffer_index = buffer_index + 1; //increment buffer index 	

					if (buffer_index == BUF_SIZE)
					{
						// done playback
						a_flag = 0;
						*(HEX_ptr) = 0x00000000;   /*display '0000'*/	
						counter = 0;
					}
					fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
					
				}

				
				
			}
		}
		/*d note*/
		else if(d_flag)
		{
			*(HEX_ptr) = 0x7938776e;   /*display 'PLAY'*/
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
		
			if ( (fifospace & 0x00ff0000) > BUF_THRESHOLD )  //see if there is rroom to play out
			{	
				while ( (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE) )
				{


					*(audio_ptr + 2) = d_note[counter];
					*(audio_ptr + 3) = d_note[counter];

					
					counter = counter + 1;
					buffer_index = buffer_index + 1; //increment buffer index 	

					if (buffer_index == BUF_SIZE)
					{
						// done playback
						d_flag = 0;
						*(HEX_ptr) = 0x00000000;   /*display '0000'*/	
						counter = 0;
					}
					fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
					
				}

				
				
			}
		}

	}
} //close main


//takes a pointer to a memory location containing a 2 flags
//(for key1 and key2) as well as a counter to be reset. 
void key_check(int * KEY1, int * KEY2, int * KEY3, int * counter)
{
	/*memory maps*/
	volatile int *KEY_ptr = (int *) 0x10000050;		// pushbutton KEY address
	volatile int *audio_ptr = (int *) 0x10003040;	// audio port address

	int KEY_value;

	KEY_value = *(KEY_ptr); 				// read the pushbutton KEY value
	

	while (*KEY_ptr);				/*hard loop until a key release*/

	if (KEY_value == 0x2)					// check KEY1
	{
		*KEY1 = 1;
		// reset counter to start playback
		*counter = 0;
		// clear audio-out FIFO
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
	}
	else if (KEY_value == 0x4)				// check KEY2
	{
		*KEY2 = 1;
		// reset counter to start playback
		*counter = 0;
		// clear audio-out FIFO
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
	}
	else if (KEY_value == 0x8)				// check KEY3
	{
		*KEY3 = 1;
		// reset counter to start playback
		*counter = 0;
		// clear audio-out FIFO
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
	}
	
}
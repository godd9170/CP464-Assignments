/* audio.c
 * Record and playback audio
 * written by Henry Goddard
 * 2/5/15
 */
 
 /* globals */
#define BUF_SIZE 150000			// about 3 seconds of buffer (@ 48K samples/sec)
#define BUF_THRESHOLD 96		// 75% of 128 word buffer



int main()
{
	
	volatile int *audio_ptr = (int *) 0x10003040;	// audio port address
	volatile int *HEX_ptr = (int *) 0x10000020;  //hex displays
	volatile int *HEX2_ptr = (int *) 0x10000030;  //hex displays
	volatile int *switches_ptr = (int *) 0x10000040; //switches

	/* used for audio record/playback */
	int fifospace, leftdata, rightdata;
	int record = 0, play = 0, buffer_index = 0, counter = 0;
	int left_buffer[BUF_SIZE];
	int right_buffer[BUF_SIZE];

	*(HEX_ptr) = 0x00000000;   /*display '0000'*/

	/*loop indefinitely looking for the play/record buttons*/

	while(1)
	{
		
		if( *(switches_ptr) == 1){
			*(HEX2_ptr) = 0x006d383f;   /*display 'SLO'*/
		}
		else if (*(switches_ptr) == 2){
			*(HEX2_ptr) = 0x71776d78;   /*display 'fast'*/	
		}
		else {
			*(HEX2_ptr) = 0x00000000;   /*display '0000'*/	
		}
		
		key_check ( &record, &play, &buffer_index );
		/*record mode*/
		if(record)
		{
			*(HEX_ptr) = 0x00507939;   /*display 'REC'*/
			fifospace = *(audio_ptr + 1);	 		// update the audio port fifospace register
			if ( (fifospace & 0x000000FF) > BUF_THRESHOLD )  //see if there is room to record
			{
				while ( (fifospace & 0x000000FF) && (buffer_index < BUF_SIZE) )
				{
					left_buffer[buffer_index] = *(audio_ptr + 2);  //put the value in the left channel into memory
					right_buffer[buffer_index] = *(audio_ptr + 3);  //put the value in the right channel into memory
					
					buffer_index = buffer_index + 1; //increment buffer index 
					
					//check if the buffer is full
					if (buffer_index == BUF_SIZE)
						{
							record = 0; //toggle record off
							*(HEX_ptr) = 0x00000000;   /*display '0000'*/
						}
					fifospace = *(audio_ptr + 1);	// update audio port fifospace register
				}
			}
		
		}
		/*play mode*/
		else if(play)
		{
			*(HEX_ptr) = 0x7938776e;   /*display 'PLAY'*/
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
		
			if ( (fifospace & 0x00ff0000) > BUF_THRESHOLD )  //see if there is rroom to play out
			{	
				while ( (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE) )
				{
					*(audio_ptr + 2) = left_buffer[buffer_index];
					*(audio_ptr + 3) = right_buffer[buffer_index];
					counter = counter + 1;
					
					if( *(switches_ptr) == 2){
						buffer_index = buffer_index + 2; //increment buffer index (make 2 for chipmunk)
					}
					else if( *(switches_ptr) == 1){
						if (counter % 2){
							buffer_index = buffer_index + 1; //increment buffer index  (play again for slomo)
						}
					}
					else {
						buffer_index = buffer_index + 1; //increment buffer index 	
					}

					if (buffer_index == BUF_SIZE)
					{
						// done playback
						play = 0;
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
void key_check(int * KEY1, int * KEY2, int * counter)
{
	/*memory maps*/
	volatile int *KEY_ptr = (int *) 0x10000050;		// pushbutton KEY address
	volatile int *audio_ptr = (int *) 0x10003040;	// audio port address

	int KEY_value;

	KEY_value = *(KEY_ptr); 				// read the pushbutton KEY value
	

	while (*KEY_ptr);				/*hard loop until a key release*/

	if (KEY_value == 0x2)					// check KEY1
	{
		// reset counter to start recording
		*counter = 0;
		// clear audio-in FIFO
		*(audio_ptr) = 0x4;
		*(audio_ptr) = 0x0;

		*KEY1 = 1;
	}
	else if (KEY_value == 0x4)				// check KEY2
	{
		// reset counter to start playback
		*counter = 0;
		// clear audio-out FIFO
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;

		*KEY2 = 1;
	}
}
/*Header audio file */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define SCREEN_BUFFER 86800
#define AUDIO_BUF_SIZE 23999		

int * record_audio();

void handle_audio_interrupt();
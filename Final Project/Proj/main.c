#include <math.h>
#include <stdlib.h>
#include "VGA.h"
#include "audio.h"
#include "nios2_ctrl_reg_macros.h"
//constants
#define SCREEN_BUFFER 76800
#define AUDIO_BUF_SIZE 23999
#define WHITE 0xffff
#define RED 0xf8000
#define PI 3.14159265358979323846

int y(float y_w);
int x(float x_w);
void gpu_sync();
void delay();

int main ()
{
	volatile int *vga_ptr = (int *) 0x10003020;	// VGA Address
	volatile int *vga_buffer_ptr = (int *) 0x08000000; //VGA Buffer
	volatile int *vga_front_buffer = (int *) 0x10003020;
	volatile int *vga_back_buffer = (int *) 0x10003024;
	volatile int *vga_resolution = (int *) 0x10003028;
	volatile int *vga_status = (int *) 0x1000302c;
	volatile int *audio_ptr = (int *) 0x10003040;
	int counter = 0;
	int * sound;
	
	//clear screen
	init_screen();
	
	

	//Enable the audio interrupts
	*audio_ptr |= (1 << 0);  //Set enable audio read interrupts
	NIOS2_WRITE_IENABLE( 0x64 ); /* set interrupt mask bits for audio*/
	NIOS2_WRITE_STATUS( 1 ); // enable Nios II interrupts
	
	while(1){;};
	
}




void delay() {
	volatile int c = 1, d = 1;
	for ( c = 1 ; c <= 32767 ; c++ )
       for ( d = 1 ; d <= 20 ; d++ )
       {}
}



//Convert y input to a Cartesian coordinate system
int y(float y_w)
{
	return (int) (120 - (y_w * 2));
}


//Convert x input to a Cartesian coordinate system
int x(float x_w)
{
	return (int) (160 + (x_w * 2));
}

void gpu_sync() 
{
	volatile int *vga_front_buffer = (int *) 0x10003020;
	volatile int *vga_status = (int *) 0x1000302c;
	
	*vga_front_buffer |= 0x1;	//write a 0x1 to the front buffer to initialize sync
	while( *vga_status & 0x1 ){;}; //wait for next 1/60th cycle
}
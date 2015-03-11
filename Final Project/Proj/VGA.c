/* VGA Test */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "VGA.h"
#define SCREEN_BUFFER 76800
#define AUDIO_BUF_SIZE 23999	


/* simple swap routine */
void swap(int *i, int *j) {
   int t = *i;
   *i = *j;
   *j = t;
}


/* draws a line into the VGA buffer from (x0,y0) to (x1,y1) */
void draw_line(int x0,int y0,int x1,int y1,short color)
{

	int is_steep = abs(y1 - y0) > abs(x1 - x0);


	if(is_steep) {
		swap(&x0, &y0);
		swap(&x1, &y1);
	}
	if(x0 > x1) {
		swap(&x0,&x1);
		swap(&y0,&y1);
	}
	
	int deltax = x1 - x0;
	int deltay = abs(y1 - y0);
	float slope = (float) deltay / deltax;
	float error = 0;
	int y_step;
	int y = y0;
	//determine positive or negative slope
	if(y0 < y1){
		y_step = 1;
	}else{
		y_step = -1;
	}
	
	int x;
	for ( x=x0; x < x1; x++ )
	{
		if (is_steep){ 
			draw_pixel(y,x,color);
		}else{
			draw_pixel(x,y,color);
		}
		
		error = error + slope;
		
		if (error >= 0.5){
			y = y + y_step;
			error = error - 1.0;
		}
	}
}

/*places a red pixel at the location (x,y)*/
void draw_pixel(int x,int y, short color) {
	volatile short *vga_buffer_ptr = (short *) 0x08000000;//VGA Buffer
	unsigned int offset = (x << 1) + (y << 10);
	offset >>= 1;
	*(vga_buffer_ptr + offset) = color; //paint the pixel
}

/*fill the screen with black pixels*/
void init_screen() {
	int i,j = 0;	
	while(i < 240){
		while(j < 320){
			draw_pixel(j,i,0xffff);
			j++;
		}
		j = 0;
		i++;
	}
	
}

/*fill screen with color from microphone*/
void color_screen(int color[]) {
	volatile short *vga_buffer_ptr = (short *) 0x08000000;//VGA Buffer
	short i,j = 0;
	
	while(i < 240){
		while(j < 320){
			draw_pixel(j,i,color[i*j]); //color
			j++;
		}
		j = 0;
		i++;
	}
}
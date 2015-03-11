/*Header VGA File*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define SCREEN_BUFFER 76800

void swap(int *i, int *j);

void draw_line(int x0,int y0,int x1,int y1, short color);

void draw_pixel(int x, int y, short color);

void init_screen();

void color_screen(int color[]);
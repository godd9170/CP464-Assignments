/* main.c
 * a c program that determines the largest number in a list. 
 * written for part 4 - lab 2 CP464
 * written by Henry Goddard
 * 1/19/15
 */
  
#include <stdio.h>
  
int main()
{
	int numbers[7] = { 4, 5, 3, 6, 1, 8, 2 };
	int result;
	int i; 											/*counter*/
	int *result_location = (int *) 0x800;			/*pointer to result location*/
	
	result = numbers[0];							/*set result initially to beginning of array */
	
	for ( i = 0; i < 7; i++ ) {
		if(result > numbers[i])
		{
			result = numbers[i];
		}
	} /*-for-*/
	
	result_location = result;						/*ensure resulting highest number is stored in 0x800*/
	
}
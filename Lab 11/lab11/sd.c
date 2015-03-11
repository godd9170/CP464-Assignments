#define READ_BLOCK 17
#define WRITE_BLOCK 24

/********************************************************************************
 * Main read from SD card and put out to terminal
********************************************************************************/
int main(void)
{
	volatile int * JTAG_UART_ptr 	= (int *) 0x10001000;	// JTAG UART address
	volatile int * SD_CARD_BUFFER_START = (int *) 0x0B000000;
	volatile int * SD_CARD_ARG_PTR = (int *) 0x0B00022C;
	volatile int * SD_CARD_CMD_PTR = (int *) 0x0B000230;
	volatile int * AUX_STATUS_REG = (int *) 0x0B000234;

	
	
	
	int data, i;
	char text_string[] = "\nThis is test text\n> \0";
	char letter;
	
	/* put card in write mode */
	write_mode_SD (SD_CARD_ARG_PTR, SD_CARD_CMD_PTR);
	/* write a text string to the SD card*/
	for (i = 0; text_string[i] != 0; ++i)
		put_jtag (JTAG_UART_ptr, text_string[i]);
		*(SD_CARD_BUFFER_START + i) = text_string[i];
		
	/* put card in read mode */
	read_mode_SD (SD_CARD_ARG_PTR, SD_CARD_CMD_PTR);
	/* read from the SD card and put to the console*/
	for (i = 0; text_string[i] != 0; ++i)
		letter = (char) *(SD_CARD_BUFFER_START + i);
		put_jtag (JTAG_UART_ptr, letter);		
}

/********************************************************************************
 * Subroutine to send a character to the JTAG UART
********************************************************************************/
void put_jtag( volatile int * JTAG_UART_ptr, char c )
{
	int control;
	control = *(JTAG_UART_ptr + 1);			// read the JTAG_UART control register
	if (control & 0xFFFF0000)					// if space, then echo character, else ignore 
		*(JTAG_UART_ptr) = c;
}

/********************************************************************************
 * Subroutine to enable write mode for the SD card
********************************************************************************/
void write_mode_SD( volatile int * SD_CARD_ARG_PTR,volatile int * SD_CARD_CMD_PTR,volatile int * AUX_STATUS_REG)
{
	short int status;

	*SD_CARD_ARG_PTR = (10) * 512;
	*SD_CARD_CMD_PTR = WRITE_BLOCK;
	
	/* Wait until the operation completes. */
/* 	do {
	status = *AUX_STATUS_REG;
	} while ((status & 0x04)!=0); */

}

/********************************************************************************
 * Subroutine to enable read mode for the SD card
********************************************************************************/
void read_mode_SD( volatile int * SD_CARD_ARG_PTR,volatile int * SD_CARD_CMD_PTR, volatile int * AUX_STATUS_REG)
{
	short int status;

	/* Read 11th sector on the card */
	*SD_CARD_ARG_PTR = (10) * 512;
	*SD_CARD_CMD_PTR = READ_BLOCK;
	
	/* do {
	status = *AUX_STATUS_REG;
	} while ((status & 0x04)!=0); */
}
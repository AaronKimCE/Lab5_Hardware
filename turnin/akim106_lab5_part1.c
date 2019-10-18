/*	Author: akim106
 *	 *  Partner(s) Name: 
 *	  *	Lab Section:
 *	   *	Assignment: Lab 5  Exercise 1
 *	    *	Exercise Description: [optional - include for your own benefit]
 *	     *
 *	      *	I acknowledge all content contained herein, excluding template or example
 *	       *	code, is my own original work.
 *	        */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    DDRA = 0x00; PORTA = 0xFF; //PORT A = inputs
    DDRC = 0xFF; PORTC = 0x00; //PORT C = outputs
    unsigned char tmpIN = 0x00; //Temporary input and outputs to manipulate data
    unsigned char tmpOUT = 0x00;

    while (1) {
      tmpIN = ~PINA; //Getting input and resetting output
      tmpOUT = 0x00;

      if ((tmpIN & 0x0F) > 0x00) { //Checking fuel light 1
        tmpOUT = tmpOUT | 0x01; //Setting right bit to 1 if fuel level 1 or more
      }
      tmpOUT = tmpOUT << 1; //Pushing the right bit leftward

      if ((tmpIN & 0x0F) > 0x02) { //Checking 2
        tmpOUT = tmpOUT | 0x01;
      }
      tmpOUT = tmpOUT << 1;

      if ((tmpIN & 0x0F) > 0x04) { //Checking 3
        tmpOUT = tmpOUT | 0x01;
      }
      tmpOUT = tmpOUT << 1;
      
      if ((tmpIN & 0x0F) > 0x06) { //Checking 4
        tmpOUT = tmpOUT | 0x01;
      }
      tmpOUT = tmpOUT << 1;
      
      if ((tmpIN & 0x0F) > 0x09) { //Checking 5
        tmpOUT = tmpOUT | 0x01;
      }
      tmpOUT = tmpOUT << 1;
      
      if ((tmpIN & 0x0F) > 0x0C) { //Checking 6
        tmpOUT = tmpOUT | 0x01;
      }
      
      if ((tmpOUT & 0x08) != 0x08) { //Checking if PC3 is 0, if true turns the low fuel light on
        tmpOUT = tmpOUT | 0x40; 
      }
      
      if ((tmpIN & 0x70) == 0x30) { //Checking if only key and seated bits are 1
        tmpOUT = tmpOUT | 0x80; //Turns on the Fasten seatbelt light (PC7)
      }

      PORTC = tmpOUT; //Setting output     
    }
    return 1;
}

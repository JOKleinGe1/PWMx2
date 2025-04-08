//test.c
#include <stdint.h>

#define   SWADDRESS     (*(volatile uint8_t *)   0x8004)
#define   HEXADDRESS    (*(volatile uint32_t *)  0x8010)

int main (void){

  while (1){
    HEXADDRESS = SWADDRESS; 
  }
  return 0;  
}


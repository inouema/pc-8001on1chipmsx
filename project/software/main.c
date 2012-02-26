#include <stdio.h>
#define ADDR_IO_BEEP (unsigned char)(0x40)

extern outp(unsigned char, unsigned char);

int main(void)
{
    outp(ADDR_IO_BEEP, 0x00);
    __asm
        nop
    __endasm;

	outp(ADDR_IO_BEEP, 0xFF);

    return 0;
}

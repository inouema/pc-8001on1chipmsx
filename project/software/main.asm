;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.1.2 #7349 (Feb 25 2012) (MINGW32)
; This file was generated Sun Feb 26 04:10:27 2012
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _outp
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:6: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:8: outp(ADDR_IO_BEEP, 0x00);
	ld	hl,#0x0040
	push	hl
	call	_outp
	pop	af
;main.c:11: __endasm;
	nop
;main.c:13: outp(ADDR_IO_BEEP, 0xFF);
	ld	hl,#0xFF40
	push	hl
	call	_outp
	pop	af
;main.c:15: return 0;
	ld	hl,#0x0000
	ret
_main_end::
	.area _CODE
	.area _CABS (ABS)

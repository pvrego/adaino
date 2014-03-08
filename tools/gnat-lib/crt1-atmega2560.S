#define SPL 0x3d
#define SPH 0x3e
#define SREG 0x3f
#define RAMPZ 0x3b

#define RAMEND (4 * 1024)
	
	.section .vectors,"ax",@progbits
#define VECTOR(x) \
	.weak x			$ \
	.set x, __bad_interrupt $ \
	jmp x

	.global	__vectors
	.func	__vectors
__vectors:
__reset:
	jmp	__init
	VECTOR(__vector_int0)
	VECTOR(__vector_int1)
	VECTOR(__vector_int2)
	VECTOR(__vector_int3)
	VECTOR(__vector_int4)
	VECTOR(__vector_int5)
	VECTOR(__vector_int6)
	VECTOR(__vector_int7)
	VECTOR(__vector_pcint0)
	VECTOR(__vector_pcint1)
	VECTOR(__vector_pcint2)
	VECTOR(__vector_wdt)
	VECTOR(__vector_timer2_compa)
	VECTOR(__vector_timer2_compb)
	VECTOR(__vector_timer2_ovf)
	VECTOR(__vector_timer1_capt)
	VECTOR(__vector_timer1_compa)
	VECTOR(__vector_timer1_compb)
	VECTOR(__vector_timer1_compc)
	VECTOR(__vector_timer1_ovf)
	VECTOR(__vector_timer0_compa)
	VECTOR(__vector_timer0_compb)
	VECTOR(__vector_timer0_ovf)
	VECTOR(__vector_spi_stc)
	VECTOR(__vector_usart0_rx)
	VECTOR(__vector_usart0_udre)
	VECTOR(__vector_usart0_tx)
	VECTOR(__vector_analog_comp)
	VECTOR(__vector_ee_ready)
	VECTOR(__vector_adc)
	VECTOR(__vector_timer3_capt)
	VECTOR(__vector_timer3_compa)
	VECTOR(__vector_timer3_compb)
	VECTOR(__vector_timer3_compc)
	VECTOR(__vector_timer3_ovf)	
	VECTOR(__vector_usart1_rx)
	VECTOR(__vector_usart1_udre)
	VECTOR(__vector_usart1_tx)
	VECTOR(__vector_twi)
	VECTOR(__vector_spm_ready)
	VECTOR(__vector_timer4_capt)
	VECTOR(__vector_timer4_compa)
	VECTOR(__vector_timer4_compb)
	VECTOR(__vector_timer4_compc)
	VECTOR(__vector_timer4_ovf)
	VECTOR(__vector_timer5_capt)
	VECTOR(__vector_timer5_compa)
	VECTOR(__vector_timer5_compb)
	VECTOR(__vector_timer5_compc)
	VECTOR(__vector_timer5_ovf)	
	VECTOR(__vector_usart2_rx)
	VECTOR(__vector_usart2_udre)
	VECTOR(__vector_usart2_tx)
	VECTOR(__vector_usart3_rx)
	VECTOR(__vector_usart3_udre)
	VECTOR(__vector_usart3_tx)
	.endfunc
	
	.global	exit
	.func	exit
exit:	rjmp exit
	.endfunc

	/* Handle unexpected interrupts (enabled and no handler), which
	   usually indicate a bug.  Jump to the __vector_default function
	   if defined by the user, otherwise jump to the reset address.

	   This must be in a different section, otherwise the assembler
	   will resolve "rjmp" offsets and there will be no relocs.  */

	.text
	.global	__bad_interrupt
	.func	__bad_interrupt
__bad_interrupt:
	jmp	__reset
	.endfunc

	.section .init0,"ax",@progbits
	.weak	__init
;	.func	__init
__init:
	.weak	__stack

	/* By default, malloc() uses the current value of the stack pointer
	   minus __malloc_margin as the highest available address.

	   In some applications with external SRAM, the stack can be below
	   the data section (in the internal SRAM - faster), and __heap_end
	   should be set to the highest address available for malloc().  */
	.weak	__heap_end
	.set	__heap_end, 0

	.section .init2,"ax",@progbits
	/* Init SREG.  */
	clr	r1
	out	SREG, r1
	/* Init stack.  */
	ldi	r28,lo8(__stack)
	ldi	r29,hi8(__stack)
	out	SPH, r29
	out	SPL, r28

#if 1
	/* Only for >64K devices with RAMPZ, replaces the default code
	   provided by libgcc.S which is only linked in if necessary.  */

	.section .init4,"ax",@progbits
	.global __do_copy_data
__do_copy_data:
	ldi	r17, hi8(__data_end)
	
	ldi	r26, lo8(__data_start)
	ldi	r27, hi8(__data_start)
	
	ldi	r30, lo8(__data_load_start)
	ldi	r31, hi8(__data_load_start)
	ldi	r16, hh8(__data_load_start)
	out	RAMPZ, r16

0:	
	cpi	r26, lo8(__data_end)
	cpc	r27, r17
	breq	1f
	
	elpm	r0, Z+
	st	X+, r0
	rjmp	0b
1:	
#endif

	.set	__stack, RAMEND

	.section .init9,"ax",@progbits
	call	main
	jmp	exit
;	.endfunc

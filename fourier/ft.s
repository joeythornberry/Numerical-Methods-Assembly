.global _start
.section .text

_start:

	mov	x0, #0
	ldr 	x1, =output_filename 	/* OPEN output file */
	mov 	x2, 0101
	mov	x3, 0666
	mov 	x8, #56
	svc	#0
	mov 	x10, x0		/* store file descriptor */

	cmp 	x0, #0
	b.lt	error_open_output

	mov 	x0, #0
	ldr 	x1, =input_filename 	/* OPEN input file */
	mov 	x2, 0000
	mov 	x8, #56
	svc	#0
	mov 	x9, x0		/* store file descriptor */

	cmp 	x0, #0
	b.lt	error_open_input

	sub 	sp, sp, #16 	/* READ from input file */
	mov 	x0, x9
	mov 	x1, sp
	mov 	x2, #16
	mov 	x8, #63
	svc 	#0

	mov	x0, x10 	/* WRITE to output */
	mov 	x1, sp
	mov 	x2, #16
	mov	x8, #64
	svc	#0
	
	mov 	x0, x9		/* CLOSE file */
	mov 	x8, #57
	svc 	#0

	mov 	x0, x10		/* CLOSE file */
	mov 	x8, #57
	svc 	#0

	b 	exit

error_open_output:
	mov	x0, #1 	/* WRITE to output */
	ldr 	x1, =outputerrmsg
	ldr 	x2, =outputerrlen
	mov	x8, #64
	svc	#0
	b 	exit

error_open_input:
	mov	x0, #1 	/* WRITE to output */
	ldr 	x1, =inputerrmsg
	ldr 	x2, =outputerrlen
	mov	x8, #64
	svc	#0
	b 	exit

exit:
	add	sp, sp, #16
	mov	x0, #0		/* EXIT program */
	mov 	x8, #93
	svc	#0

.section .data

output_filename: .asciz "/home/math/asm/fourier/out.bin"

input_filename: .asciz "/home/math/asm/fourier/in.bin"


outputerrmsg:
	.ascii "error opening output\n"
outputerrlen = . - outputerrmsg

inputerrmsg:
	.ascii "error opening input\n"
inputerrlen = . - inputerrmsg

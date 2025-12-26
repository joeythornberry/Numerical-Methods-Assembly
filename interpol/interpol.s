.global secant 
.type 	secant "function"
secant:
	stp	x29, x30, [sp, #-16]!
	
	mov 	x10, #200

	fmov 	s9, s1 	/* move x_0 and x_1 */
	fmov 	s8, s0

iterate:
	fmov 	s0, s8
	bl 	g	/* calculate f(x_0) */
	fmov 	s10, s0  

	fmov 	s0, s9
	bl 	g
	fmov 	s11, s0
	
	fsub 	s12, s9, s8 	/* x_1 - x_0 */
	fmul	s12, s12, s11	/* f(x_1) * (x_1 - x_0) */
	fsub 	s13, s11, s10
	fdiv	s12, s12, s13 	/* f(x_1) * (x_1 - x_0) / (f(x_1) - f(x_0)) */
	
	fmov 	s8, s9
	fmov 	s9, s12

	subs 	x10, x10, #1
	b.gt 	iterate

	fmov 	s0, s9
	ldp 	x29, x30, [sp], #16
	ret

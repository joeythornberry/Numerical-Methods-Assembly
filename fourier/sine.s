	.global	sine
	.type	sine "function"
sine:
	stp 	x29, x30, [sp, -16]!

	fmov 	s1, s0 		/* partial sum */
	fmov	s2, #1.0	/* n */
	fmov	s3, #1.0	/* sign */
	fmov 	s4, s0  	/* nth term of sequence */
loop:
	fmov	s5, #10.0
	fcmp 	s5, s2
	b.lt 	finish
	
	fmov 	s5, #1.0
	fadd	s2, s2, s5	/* increment n */
	fmul 	s4, s4, s0 	/* mult by x */
	fdiv 	s4, s4, s2	/* div by n */
	
	fadd 	s2, s2, s5	/* increment n */
	fmul 	s4, s4, s0 	/* mult by x */
	fdiv 	s4, s4, s2	/* div by n */
	
	fmov 	s5, #-1.0
	fmul 	s3, s3, s5 	/* invert sign */
	fmadd 	s1, s4, s3, s1	/* sign nth term */
	
	b	 loop

finish: 
	fmov 	s0, s1 		/* return nth partial */
	
	ldp 	x29, x30, [sp], 16
	ret

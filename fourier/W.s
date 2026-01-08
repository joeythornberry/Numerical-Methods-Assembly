.global W
.type 	W "function"
W:
	/* x0: integer exponent */
	/* x1: N */
	
	stp 	x29, x30, [sp, -16]!
	
	ldr	s1, =0x40c90fda	/* 2pi */
 
	ucvtf 	s10, x0		/* load integer params into floating point registers */
	ucvtf 	s0, x1
	fdiv 	s10, s10, s0 	/* divide exponent by N */
	frinta 	s0, s10		/* round result to nearest integer */
	fsub 	s10, s10, s0 	/* subtract rounded from original, leaving residue */
	
	fmul 	s10, s10, s1 	/* now multiply residue by 2pi, forming theta */
	
	fmov 	s0, s10		/* take sine of theta */
	bl 	sine
	fmov 	s11, s0

	fmov 	s0, s10		/* take cosine of theta */
	bl 	cosine
	fmov 	s1, s11

	ldp	x29, x30, [sp], 16
	ret

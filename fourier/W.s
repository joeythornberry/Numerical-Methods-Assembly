.global W
.type 	W "function"
W:
	/* x0: integer exponent */
	stp 	x29, x30, [sp, #-16]!

	fmov 	s0, 2.0
	ucvtf 	s1, x0
	bl powf
	
	ldp 	x29, x30, [sp], #-16
	ret

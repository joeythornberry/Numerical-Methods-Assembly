.global simpson
.type 	simpson	"function"
simpson:
	stp	x29, x30, [sp, #-16]!
	
	fsub	s11, s1, s0	/* h = b - a */
        fdiv    s11, s11, s2	/* h = (b - a) / n */
	fmov 	s9, s0		/* a */
	fmov 	s10, s1		/* b */
	fsub 	s12, s12, s12 	/* J */

	bl 	g
        fadd 	s12, s12, s0	/* f_0 */

	fmov 	s0, s10
	bl 	g
	fadd	s12, s12, s0	/* f_2n */

	fmov 	s13, 4.0

iterate:
	fadd 	s9, s9, s11	/* x = x + h */

	fcmp 	s9, s10
	b.gt	done

	fmov 	s0, s9
	bl 	g
	fmul 	s0, s0, s13	/* 4f_odd */
	fadd	s12, s12, s0

	fadd 	s9, s9, s11	/* x = x + h */
	fmov 	s0, s9
	bl 	g
	fadd 	s0, s0, s0	/* 2f_even */
	fadd	s12, s12, s0

	b 	iterate

done:
	fmov 	s13, 3.0
	fdiv 	s12, s12, s13	/* divide total by 3 */
	fmul	s12, s12, s11	/* multiply total by h */
	fmov 	s0, s12

	ldp 	x29, x30, [sp], #16
	ret

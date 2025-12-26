.global fixedpoint
.type 	fixedpoint "function"
fixedpoint:
	stp	x29, x30, [sp, #-16]!
	
	mov 	x10, #200

iterate:
	bl 	g
	subs 	x10, x10, #1
	b.gt 	iterate

	ldp 	x29, x30, [sp], #16
	ret

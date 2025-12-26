.global		newton	
.type		newton "function"
.p2align	4
newton:
	mov 	x29, lr
	bl 	f
	mov 	lr, x29
	ret

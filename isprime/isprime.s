.global		isprime
.type		isprime "function"
.p2align	4
isprime:
	mov 	x1, #1		/* x1 will hold the potential factors of x0 */
foreachfactor:
	add 	x1, x1, #1 	/* increment potential factor */
	mul	x2, x1, x1	/* calculate square of factor */
 	subs 	x3, x0, x2  	/* subtract square from input */
	b.lt 	prime		/* if the square of the factor is larger than the input, input is prime */
checkfactor:
	b.eq 	composite	/* if the factor divides the input, input is composite */
	subs	x3, x3, x1	/* subtract the factor from the input again */
	b.lt 	foreachfactor	/* if the result is negative, this is not a factor of the input */
	b checkfactor		/* keep subtracting */
prime:
	mov 	x0, #1 		/* the input is prime */
	ret
composite:
	mov x0, #0 		/* the input is composite */
	ret

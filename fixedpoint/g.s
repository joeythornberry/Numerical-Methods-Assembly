.global	g
.type	g "function"
g:
	fmov	s1, #1.0	
	fdiv 	s1, s1, s0
	fmov	s0, #3.0
	fsub 	s0, s0, s1
	ret

test: test.o
	gcc -o test test.c sine.s cosine.s W.s -lm
	./test
	rm *.o

old: test-W.o
	as -o test-W.o test-W.s W.s
	ld -s -o test-W.out test-W.o -lc -lm
	./test-W.out
	as -o test-sin.o test-sin.s sin.s
	ld -s -o test-sin.out test-sin.o -lc -lm
	./test-sin.out
	rm *.o
	rm *.out

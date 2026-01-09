data:
	cobc -x DECTOBIN.cbl
	./DECTOBIN
	hexdump in.bin
       
test:
	gcc -o test.out test.c sine.s cosine.s W.s
	./test.out
	rm *.out *.o

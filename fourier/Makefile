data:
	cobc -x DECTOBIN.cbl
	./DECTOBIN
	hexdump in.bin
       
test:
	gcc -o test.out test.c sine.s cosine.s W.s
	./test.out
	rm *.out

ft:
	rm out.bin
	as -g -o ft.o ft.s
	ld -o ft.out ft.o
	strace ./ft.out
	rm *.o
	hexdump in.bin
	hexdump out.bin

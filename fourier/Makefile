data:
	cobc -x DECTOBIN.cbl
	./DECTOBIN
	hexdump in.bin
       
test:
	gcc -o test.out test.c sine.s cosine.s W.s
	./test.out
	rm *.out

ft:
	touch out.bin
	rm out.bin
	as -g -o ft.o ft.s W.s sine.s cosine.s
	ld -o ft.out ft.o
	./ft.out
	rm *.o
	hexdump in.bin
	hexdump out.bin
	./BINTODEC
	cat out.dec

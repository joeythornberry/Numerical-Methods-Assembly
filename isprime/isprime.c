#include <stdio.h>
#include <stdlib.h>

extern int isprime(int a) ;

int main(int argc, char ** argv) {
	int a = atoi(argv[1]);
	if (isprime(a)) printf("1\n");
	else printf("0\n");
	return(0);
}

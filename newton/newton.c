#include <stdio.h>
#include <stdlib.h>

extern float newton(float a);

int main(int argc, char ** argv) {
	float a = atof(argv[1]);
	printf("INPUT %f OUTPUT %f\n",a,newton(a));
	return(0);
}

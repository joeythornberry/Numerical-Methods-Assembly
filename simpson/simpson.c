#include <stdio.h>
#include <stdlib.h>

extern float simpson(float a, float b, float n);
extern float g(float x);

int main(int argc, char ** argv) {
	float a = atof(argv[1]);
	float b = atof(argv[2]);
	float n = atof(argv[3]);
	float J = simpson(a,b,n);
	printf("INPUT %f OUTPUT %f\n",a,g(a));
	printf("a %f b %f n %f OUTPUT %f\n",a,b,n,J);
	return(0);
}

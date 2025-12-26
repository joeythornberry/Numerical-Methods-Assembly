#include <stdio.h>
#include <stdlib.h>

extern float fixedpoint(float x_0);
extern float g(float x);

int main(int argc, char ** argv) {
	float x_0 = atof(argv[1]);
	printf("INPUT %f OUTPUT %f\n",x_0,g(x_0));
	printf("X_0 %f OUTPUT %f\n",x_0,fixedpoint(x_0));
	return(0);
}

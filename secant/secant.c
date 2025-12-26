#include <stdio.h>
#include <stdlib.h>

extern float secant(float x_0, float x_1);
extern float g(float x);

int main(int argc, char ** argv) {
	float x_0 = atof(argv[1]);
	float x_1 = atof(argv[2]);
	float x = secant(x_0,x_1);
	printf("INPUT %f OUTPUT %f\n",x_0,g(x_0));
	printf("X_0 %f X_1 %f OUTPUT %f\n",x_0,x_1,x);
	return(0);
}

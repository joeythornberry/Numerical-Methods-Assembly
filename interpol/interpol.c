#include <stdio.h>
#include <stdlib.h>

extern float interpol(float x_0, float f_0, float x_1, float f_1, float x_2, float y_2, float x_3, float y_3 );
extern float g(float x);

int main(int argc, char ** argv) {
	float x_0 = atof(argv[1]);
	float x_1 = atof(argv[2]);
	float x = secant(x_0,x_1);
	printf("INPUT %f OUTPUT %f\n",x_0,g(x_0));
	printf("X_0 %f X_1 %f OUTPUT %f\n",x_0,x_1,x);
	return(0);
}

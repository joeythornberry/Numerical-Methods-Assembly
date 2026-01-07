#include <stdio.h>
#include <assert.h>

extern float sine(float x);
extern float cosine(float x);

int floatcmp(float a, float b) {
	printf("Comparing %f and %f\n", a, b);
	float c = a - b;
	if (c < 0) c *= -1.0f;
	return c < 0.01;
}

int main() {
	printf("TESTING SINE\n");
	float sinevals[] = { 0.0f,0.0, 1.5707796f,1.0f, -1.5707796f,-1.0f, 0.3154f,0.311147f, 0.5f,0.479425 };
	for (int i = 0; i < 10; i += 2) {
		assert(floatcmp(sine(sinevals[i]),sinevals[i+1]));
	}

	printf("TESTING COSINE\n");
	float cosinevals[] = { 0.0f,1.0f, 1.5707796f,0.0000167f, -1.5707796f,0.0000167f, 0.2135f,0.977295, 0.5f,0.877582 };
	for (int i = 0; i < 10; i += 2) {
		assert(floatcmp(cosine(cosinevals[i]),cosinevals[i+1]));
	}
	
	return 0;
}

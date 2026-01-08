#include <stdio.h>
#include <assert.h>

typedef struct Complex {
	float a;
	float b;
} Complex;

extern float sine(float x);
extern float cosine(float x);
extern Complex W(int exponent, int N);

int floatcmp(float a, float b) {
	//printf("Comparing %f and %f\n", a, b);
	float c = a - b;
	if (c < 0) c *= -1.0f;
	return c < 0.001;
}

int complexcmp(Complex c, float a, float b) {
	printf("Comparing %f + %fi and %f + %fi\n", c.a, c.b, a, b);
	return floatcmp(c.a, a) && floatcmp(c.b, b);
}

int main() {
	printf("TESTING SINE\n");
	float sinevals[] = { 0.0f,0.0, 1.5707796f,1.0f, -1.5707796f,-1.0f, 0.3154f,0.311147f, 3.11f,0.0315873f  };
	for (int i = 0; i < 10; i += 2) {
		assert(floatcmp(sine(sinevals[i]),sinevals[i+1]));
	}

	printf("TESTING COSINE\n");
	float cosinevals[] = { 0.0f,1.0f, 1.5707796f,0.0000167f, -1.5707796f,0.0000167f, 0.2135f,0.977295, 3.11f,-0.999501 };
	for (int i = 0; i < 10; i += 2) {
		assert(floatcmp(cosine(cosinevals[i]),cosinevals[i+1]));
	}
	
	printf("TESTING W\n");
	assert(complexcmp(W(8,5), -0.809107f, -0.587785f));
	assert(complexcmp(W(71,20), -0.951057f, -0.309107f));
	
	return 0;
}

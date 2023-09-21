#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <immintrin.h>  // Para intrínsecos AVX

#define ARRAY_SIZE 2048
#define NUMBER_OF_TRIALS 1000000

static double a[ARRAY_SIZE], b[ARRAY_SIZE], c;

int main(int argc, char *argv[]) {
    int i, t;
    double m = 1.0001;

    // Poblamos los arrays A y B
    for (i = 0; i < ARRAY_SIZE; i++) {
        b[i] = i;
        a[i] = i + 1;
    }

    // Vectorizamos el bucle interno
    __m256d vec_m = _mm256_set1_pd(m);  // Crea un vector con 4 copias del valor m
    __m256d vec_c = _mm256_setzero_pd();  // Inicializa un vector para almacenar resultados parciales de c

    for (t = 0; t < NUMBER_OF_TRIALS; t++) {
        for (i = 0; i < ARRAY_SIZE; i += 4) {
            __m256d vec_a = _mm256_loadu_pd(&a[i]);
            __m256d vec_b = _mm256_loadu_pd(&b[i]);

            __m256d result = _mm256_add_pd(_mm256_mul_pd(vec_m, vec_a), vec_b);
            vec_c = _mm256_add_pd(vec_c, result);
        }
    }

    // Sumamos los valores del vector vec_c y lo añadimos a c
    double temp[4];
    _mm256_storeu_pd(temp, vec_c);
    for (i = 0; i < 4; i++) {
        c += temp[i];
    }

    printf("Resultado: %f\n", c);

    return 0;
}

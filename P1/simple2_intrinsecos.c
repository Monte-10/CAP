#include <stdlib.h>
#include <stdio.h>
#include <x86intrin.h>
#include <immintrin.h>
#include <time.h>

#define ARRAY_SIZE 2048
#define NUMBER_OF_TRIALS 1000000

/*
 * Statically allocate our arrays.  Compilers can
 * align them correctly.
 */
static double a[ARRAY_SIZE], b[ARRAY_SIZE], c;

int main(int argc, char *argv[]) {
    int i,t,j;
    double time_spent = 0.0;

    // incializamos los vectores a y b con los primeros 4 valores que queremos

    clock_t begin = clock();

    __m256d cuatros = {4.0,4.0,4.0,4.0};
    __m256d aux_b = {0,1,2,3};
    __m256d aux_a = {1,2,3,4};
     
    _mm256_store_pd(&a[i], aux_a);     
    _mm256_store_pd(&b[i], aux_a);    
    for (i=4; i < ARRAY_SIZE; i+=4){
        
        aux_a = _mm256_hadd_pd(aux_a, cuatros); 
        _mm256_store_pd(&a[i], aux_a);    
        aux_b = _mm256_hadd_pd(aux_b, cuatros); 
        _mm256_store_pd(&b[i], aux_b);    
    }
    
    /* Perform an operation a number of times */
    for (t=0; t < NUMBER_OF_TRIALS; t++) {
        // declaramos
        __m256d mm = {1.0001, 1.0001, 1.0001, 1.0001};
        __m256d sum = {0.0, 0.0, 0.0, 0.0}; // to hold partial sums
        for (i=0; i < ARRAY_SIZE; i += 4) {
            // Load arrays
            __m256d va = _mm256_load_pd(&a[i]);
            __m256d vb = _mm256_load_pd(&b[i]);
            // Compute m*a+b
            __m256d tmp = _mm256_fmadd_pd (mm, va, vb);
            // Accumulate results
            sum = _mm256_add_pd (tmp, sum);
        }
        // Get sum[2], sum[3]
        __m128d xmm = _mm256_extractf128_pd (sum, 1);
        // Extend to 256 bits: sum[2], sum[3], 0, 0
        __m256d ymm = _mm256_castpd128_pd256(xmm);
        // Perform sum[0]+sum[1], sum[2]+sum[3], sum[2]+sum[3], 0+0
        sum = _mm256_hadd_pd (sum, ymm); 
        // Perform sum[0]+sum[1]+sum[2]+sum[3]…
        sum = _mm256_hadd_pd (sum, sum);
        c += sum[0];
        
    }
    clock_t end = clock();
    time_spent += (double)(end - begin) / CLOCKS_PER_SEC;
    printf("The elapsed time is %f seconds", time_spent);
    return 0;
}

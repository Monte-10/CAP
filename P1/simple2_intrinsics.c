#include <stdlib.h>
#include <stdio.h>
#include <x86intrin.h>
#include <immintrin.h>
#include <sys/time.h>

#define ARRAY_SIZE 2048
#define NUMBER_OF_TRIALS 1

static double a[ARRAY_SIZE], b[ARRAY_SIZE], c;

int main(int argc, char *argv[])
{
    int i, t;
    int n_trials = atoi(argv[1]);

    struct timeval start, finish;

    __m256d mm = {1.0001, 1.0001, 1.0001, 1.0001};
    __m256d sum = {0.0, 0.0, 0.0, 0.0}; // to hold partial sums

    __m256d aux_b = {0, 1, 2, 3};
    __m256d aux_a = {1, 2, 3, 4};
    __m256d cuatros = {4.0, 4.0, 4.0, 4.0};


    for (i = 0; i < ARRAY_SIZE; i += 4)
    {
        _mm256_store_pd(&b[i], aux_b);
        _mm256_store_pd(&a[i], aux_a);

        aux_b = _mm256_add_pd(aux_b, cuatros);
        aux_a = _mm256_add_pd(aux_a, cuatros);
    }

    c = 0.0;

    gettimeofday(&start, NULL);

    for (t = 0; t < n_trials; t++)
    {
        for (i = 0; i < ARRAY_SIZE; i += 4)
        {
            // Load arrays
            __m256d va = _mm256_load_pd(&a[i]);
            __m256d vb = _mm256_load_pd(&b[i]);
            // Compute m*a+b
            __m256d tmp = _mm256_fmadd_pd (mm, va, vb);
            // Accumulate results
            sum = _mm256_add_pd (tmp, sum);
        }
    }

    for (i = 0; i < 4; i++)
    {
        c += sum[i];
    }
    printf("%f\n", c);

    gettimeofday(&finish, NULL);

    printf("Time: %f\n", (double)(finish.tv_sec - start.tv_sec) + (finish.tv_usec - start.tv_usec) / 1000000.0);

    return 0;
}

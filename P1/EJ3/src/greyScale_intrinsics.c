#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <sys/time.h>
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// #include <x86intrin.h>
#include <immintrin.h>
#include <xmmintrin.h>
#include <mmintrin.h>

static inline void getRGB(uint8_t *im, int width, int height, int nchannels, int x, int y, int *r, int *g, int *b)
{

    unsigned char *offset = im + (x + width * y) * nchannels;
    *r = offset[0];
    *g = offset[1];
    *b = offset[2];
}

int main(int nargs, char **argv)
{
    int width, height, nchannels;
    struct timeval fin,ini;

    if (nargs < 2)
    {
        printf("Usage: %s <image1> [<image2> ...]\n", argv[0]);
    }
    // For each image
    // Bucle 0
    for (int file_i = 1; file_i < nargs; file_i++)
    {
        printf("[info] Processing %s\n", argv[file_i]);
        /****** Reading file ******/
        uint8_t *rgb_image = stbi_load(argv[file_i], &width, &height, &nchannels, 4);
        if (!rgb_image)
        {
            perror("Image could not be opened");
        }

        /****** Allocating memory ******/
        // - RGB2Grey
        uint8_t *grey_image = malloc(width * height);
        if (!grey_image)
        {
            perror("Could not allocate memory");
        }

        // - Filenames
        for (int i = strlen(argv[file_i]) - 1; i >= 0; i--)
        {
            if (argv[file_i][i] == '.')
            {
                argv[file_i][i] = 0;
                break;
            }
        }

        char *grey_image_filename = 0;
        asprintf(&grey_image_filename, "%s_grey.jpg", argv[file_i]);
        if (!grey_image_filename)
        {
            perror("Could not allocate memory");
            exit(-1);
        }

        /****** Computations ******/
        printf("[info] %s: width=%d, height=%d, nchannels=%d\n", argv[file_i], width, height, nchannels);

        if (nchannels != 3 && nchannels != 4)
        {
            printf("[error] Num of channels=%d not supported. Only three (RGB), four (RGBA) are supported.\n", nchannels);
            continue;
        }

        gettimeofday(&ini,NULL);

    	for (int j=0; j<height; j++) {
    		for (int i=0; i<width; i+=4) { // 4 pixeles / bucle

                // 4 bytes por pixel
                int image_offset = (i + j*width)*4; 
    			uint8_t* image = rgb_image + image_offset;

                // _mm_loadu_si128: Load 128-bits of integer data from memory into dst. mem_addr does not need to be aligned on any particular boundary.

                // 4 pixeles en 2 vectores de 2 pixeles cada uno (8 bytes por vector)
                // double = 64 bits = 8 bytes
                // Data Low: 2 pixels = 8 bytes = 64 bits
                __m128i datal = _mm_loadu_si64(image);      
                // Data High: 2 pixels = 8 bytes = 64 bits
                __m128i datah = _mm_loadu_si64(image+8);    

                // Extender a vectores de 126 bits (enteros de 16 bits)
                // Low: vec_a, vec_b
                // High: vec_c, vec_d
                // _mm256_cvtepu8_epi32: Zero extend packed unsigned 8-bit integers in a to packed 32-bit integers, and store the results in dst.
                // Extended Low
                __m256i elow = _mm256_cvtepu8_epi32(datal); 
                // Extended High
                __m256i ehigh = _mm256_cvtepu8_epi32(datah); 

                // int to float
                // _mm256_cvtepi32_ps: Convert packed signed 32-bit integers in a to packed single-precision (32-bit) floating-point elements, and store the results in dst.
                // Floating Low
                __m256 flow = _mm256_cvtepi32_ps(elow); 
                // Floating High
                __m256 fhigh = _mm256_cvtepi32_ps(ehigh); 

                // Coefficients
                // _mm256_set_pd: Set packed double-precision (64-bit) floating-point elements in dst with the supplied values.
                // __m256 holds a pair of coefficients for each of the two pixels in low and high vectors
                // Twice for two pixels
                __m256 coefficients = _mm256_setr_ps(0.2989, 0.5870, 0.114, 0, 0.2989, 0.5870, 0.114, 0); 

                // Multiplicar pixeles por coeficientes
                flow = _mm256_mul_ps(flow, coefficients);
                fhigh = _mm256_mul_ps(fhigh, coefficients);

                // Horizontal add
                // fvec_abcd <- fvec_ab hadd fvec_cd
                // result <- fvec_abcd hadd fvec_abcd
                // _mm256_hadd_ps: Horizontally add adjacent pairs of single-precision (32-bit) floating-point elements in a and b, and pack the results in dst.
                __m256 sumpartial = _mm256_hadd_ps(flow, fhigh);
                __m256 sumfinal = _mm256_floor_ps(_mm256_hadd_ps(sumpartial, sumpartial));

                // Reorder values from vector: [ACACBDBD]
                // _mm256_permutevar8x32_ps
                // 0, 4, 1, 5, 2, 6, 3, 7 (reverse)
                __m256i vperm = _mm256_setr_epi32(0, 4, 1, 5, 0, 0, 0, 0); 
                // transforms [ACACBDBD] into [ABCDABCD]
                __m256 resultpartial = _mm256_permutevar8x32_ps(sumfinal, vperm);

                // extract 4 pixels
                __m128i result = _mm_cvtps_epi32(_mm256_extractf128_ps(resultpartial, 0));

                // Store result
                __m128i perm = _mm_setr_epi8(0, 1*4, 2*4, 3*4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                result = _mm_shuffle_epi8(result, perm);
                uint32_t *tt = (uint32_t*)&result;
                *((uint32_t*)(&grey_image[i + j*width])) = *tt;
    		}
    	}

        stbi_write_jpg(grey_image_filename, width, height, 1, grey_image, 10);
        free(rgb_image);

        gettimeofday(&fin,NULL);

	printf("Tiempo: %f\n", ((fin.tv_sec*1000000+fin.tv_usec)-(ini.tv_sec*1000000+ini.tv_usec))*1.0/1000000.0);
        free(grey_image_filename);
    }
}

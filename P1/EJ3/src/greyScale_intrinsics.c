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

                // 8 bytes por vector
                __m128i datal = _mm_loadu_si64(image);      
                __m128i datah = _mm_loadu_si64(image+8);    

                // Extender a vectores de 256 bits con padding de 0
                __m256i elow = _mm256_cvtepu8_epi32(datal); 
                __m256i ehigh = _mm256_cvtepu8_epi32(datah); 

                // int to float
                __m256 flow = _mm256_cvtepi32_ps(elow); 
                __m256 fhigh = _mm256_cvtepi32_ps(ehigh); 

                // Coeficientes duplicados al haber 2 pixeles por vector
                __m256 coefficients = _mm256_setr_ps(0.2989, 0.5870, 0.114, 0, 0.2989, 0.5870, 0.114, 0); 

                // Multiplicar pixeles por coeficientes
                flow = _mm256_mul_ps(flow, coefficients);
                fhigh = _mm256_mul_ps(fhigh, coefficients);

                // Horizontal add
                __m256 sumpartial = _mm256_hadd_ps(flow, fhigh);
                // Aproximacion a floor
                __m256 sumfinal = _mm256_floor_ps(_mm256_hadd_ps(sumpartial, sumpartial));

                //permuta los pixeles en el orden correcto
                __m256i vperm = _mm256_setr_epi32(0, 4, 1, 5, 0, 0, 0, 0); 
                // ordena de ACACBDBD a ABCDABCD
                __m256 resultpartial = _mm256_permutevar8x32_ps(sumfinal, vperm);

                // extrae los 4 primeros pixeles
                __m128i result = _mm_cvtps_epi32(_mm256_extractf128_ps(resultpartial, 0));

                // guarda el resultado
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

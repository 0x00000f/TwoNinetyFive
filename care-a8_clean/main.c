
#include <stdio.h>
#include <string.h>

//void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed);
void compute_stats(int *, int, int *, int *, int *, double *, double *, double *);

#define N 80
#define NTESTS 20
#define NAMELENGTH 20

char buf[1024];
char names[N][NAMELENGTH];
int grades[N];

int min;
int max;
int num_over_avg;
double avg;
double trunc_avg;
double var;

int cycles[NTESTS];
long total;
int start_time = 150;
int end_time = 125;
char *nul;

void main () {
    int i;

    // gather input
    for (i = 0; i < N; i++) {
        nul = fgets(buf, 1024, stdin);
        sscanf(buf, "%s %d", names[i], grades+i);
    }

    // timed test
    for (i = 0; i < NTESTS; i++) {
        asm volatile (
            "cpuid\n\t"
            "rdtscp\n\t"
            "movl %%eax, %0\n\t"
            : "=r" (start_time)
            : 
            : "rax", "rbx", "rcx", "rdx"
        );

        compute_stats(grades, N, &min, &max, &num_over_avg, &avg, &trunc_avg, &var);

        asm volatile (
            "cpuid\n\t"
            "rdtscp\n\t"
            "movl %%eax, %0\n\t"
            : "=r" (end_time)
            : 
            : "rax", "rbx", "rcx", "rdx"
        );

        cycles[i] = end_time - start_time;
        if (cycles[i] >= 20000) { i--; continue; }
    }

    // display output
    printf("N: %d\n", N);
    printf("Min: %d\n", min);
    printf("Max: %d\n", max);
    printf("Average: %lf\n", avg);
    printf("Number over average: %d\n", num_over_avg);
    printf("Truncated average: %lf\n", trunc_avg);
    printf("Variance: %lf\n", var);
    putchar('\n');

    // display benchmark results
    total = 0;
    for (i = 0; i < NTESTS; i++) {
        printf("Sample %d completed in %d cycles.\n", i+1, cycles[i]);
        if (i >= NTESTS/2) {
            total += cycles[i];
        }
    }
    printf("Average of %ld cycles.\n", total/(NTESTS/2));

    return;
}


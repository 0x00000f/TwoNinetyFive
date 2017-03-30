
#include <stdio.h>
#include <math.h>

 
//void compute_stats(int *data, int N, int *min, int *max, int *num_over_avg, double *avg, double *trunc_avg, double *var) {
void compute_stats(int * __restrict data, int N, int *__restrict min, int *__restrict max, int *__restrict num_over_avg, double *__restrict avg, double *__restrict trunc_avg, double *__restrict var) {
    int i, j, k, l, m;

	//Work starts here::
	//idea: only use one for loop to execute many instructions	
	
    *min = data[0];
    *max = data[0];
    *avg = 0.0;
    *num_over_avg = 0;
    *var = 0.0;
	*trunc_avg = 0.0;
    int incl_min = 0;
    int incl_max = 0;

	if (N <= 0) { // avoid division by zero
		*num_over_avg = 0;
		*avg = NAN;
		*var = NAN;
		*trunc_avg = NAN;
		return;
	}
	if (N == 1) { // avoid division by zero
        *var = NAN;
        *trunc_avg = NAN;
        return;
    }
	if (N == 2) { // avoid division by zero
        *trunc_avg = NAN;
        return;
    }
	for (i = 1; i < N; i++) {
		//compute min
		if (data[i] < *min) {
            *min = data[i];
        }	
		//compute max
		if (data[i] > *max) {
            *max = data[i];
        }
	} 
	
	for (i = 0; i < N; i++) {
		//compute average
        *avg += (double)(data[i]);
			
		if(i == N-1){
	    	*avg /= (double)N;

			//count number over average
			for (j = 0; j < N; j++) {
				if (data[j] > *avg) {
       	    		 *num_over_avg += 1;
       		 	}
				if(j == N-1){
					//compute variance
					for(k=0; k < N; k++){ 
        				*var += (((double)(data[k]) - *avg) * ((double)(data[k]) - *avg));
						if (k == N-1){ 
							//compute truncated average
							for(l=0; l < N; l++){ 
								if (data[l] == *min && !incl_min) {
            						incl_min = 1;
            						continue;
    						    }
        						if (data[l] == *max && !incl_max) {
          	  				    	incl_max = 1;
            						continue;
       							}
        						*trunc_avg += (double)(data[l]);
							}	
						}
    					*trunc_avg /= (double)(N - 2);
					}
    				*var /= (double)(N - 1);
				}
			} 
		} 
	}
} 

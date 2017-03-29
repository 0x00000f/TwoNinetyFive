
#include <stdio.h>
#include <math.h>

 
void compute_stats(int *data, int N, int *min, int *max, int *num_over_avg, double *avg, double *trunc_avg, double *var) {
    int i;


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

	int flag1=1; //set flags
	int flag2=1; //set flags
	int flag3=1; //set flags
	int flag4=1; //set flags
	int flag5=1; //set flags

	if (N <= 0) { // avoid division by zero
				*num_over_avg = 0;
				*avg = NAN;
				*var = NAN;
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
			
/*			
		//TEST
		if(flag1==1){ 
    		*avg /= (double)N;
		}
		flag1 = 0; 
*/
		if(i == N-1){
	    	*avg /= (double)N;
		} 

		//count number over average
		if (data[i] > *avg) {
            *num_over_avg += 1;
        }
	} 
}
/*


		//compute variance
        *var += (((double)(data[i]) - *avg) * ((double)(data[i]) - *avg));
		if(flag4==1){	
			if (N == 1) { // avoid division by zero
				 *var = NAN;
				 *trunc_avg = NAN;
				 return;
			}
		} 
		flag4=0;

		//TESTTTT
		if(flag2==1){ 
   			*var /= (double)(N - 1);
		} 	
		flag2 = 0;



		//compute truncated average
   		if (data[i] == *min && !incl_min) {
       	     incl_min = 1;
       	     continue;
        }
        if (data[i] == *max && !incl_max) {
       	     incl_max = 1;
       	     continue;
        }
        *trunc_avg += (double)(data[i]);


		if(flag5==1){
			if (N == 2) { // avoid division by zero
				 *trunc_avg = NAN;
				 return;
			}
		}
		flag5=0;
	}
    *trunc_avg /= (double)(N - 2);
*/


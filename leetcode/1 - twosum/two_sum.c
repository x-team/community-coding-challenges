#include <stdio.h>

void main(){
    int nums[] = { 2, 7, 11, 15 };
    int target = 9;
    int numsLength = sizeof(nums)/sizeof(nums[0]);
    
    for(int i = 0; i < numsLength; i++) {
        for(int j = i +1; j < numsLength; j++){
            if((nums[i] + nums[j]) == target){
                printf("[%d,%d]", i, j);
                return;
            }
        }
    }
    
    return;
}
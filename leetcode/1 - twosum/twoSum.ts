function twoSum(nums: number[], target: number): number[] {
    const pairs: Map<number, number> = new Map();
    let results: number[] = [];
    
    nums.forEach((val, idx) => {
        const found = pairs.get(target - val);
        
        if (found !== undefined)
            return results = [idx, found];
        
        pairs.set(val, idx)
        
    });
    
    return results;
};

// Outras possíveis soluções
//
// function twoSum(nums: number[], target: number): number[] {
//     const pairs: Map<number, number> = new Map();
//     let results: number[] = [];
    
//     for (let i = 0; i < nums.length; i++) {
//         const value = nums[i];
//         const found = pairs.get(target - value);
        
//         if (found !== undefined)
//             return results = [i, found];
        
//         pairs.set(value, i)
//     }    
    
//     return results;
// };
//
// function twoSum(nums: number[], target: number): number[] {
//     const pairs: Map<number, number> = new Map();
//     let result: number[] = [];
    
//     for (let i = 0; i < nums.length; i++) {
//         const value = nums[i];
//         const found = pairs.get(target - value);

//         if (found !== undefined) {
//             result = [i, found];
//             break;
//         }
        
//         pairs.set(value, i); 
//     }

//     return result;
// }
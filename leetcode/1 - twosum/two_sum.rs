// Time complexity: O(N) - linear (tamanho do vetor)

// Em rust a estrutura HashMap é implementada utilizando o conceito de Hash Table
// Logo temos uma complexidade de O(1), constante, para inserção e obtenção dos dados.

// OBS: qualquer dúvida sobre a implementação é só mandar uma msg que eu 
// explico/ajudo sem problema algum ;)

impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        let mut storage = std::collections::HashMap::new();
        
        for (index, num) in nums.into_iter().enumerate(){
            let diff = target - num;
            
            match storage.get(&diff){
                Some(&value) => return vec![index as i32, value as i32],
                None => {storage.insert(num, index);},
            }
        }
        return unreachable!()
    }
}
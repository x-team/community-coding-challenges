// Time complexity: O(N) - linear (tamanho do vetor)

// A estrutura de dados map pode ser implementada de duas formas, utilizando o conceito de árvore rubro-negra
// ou Hash table. cada estrutura possui vatangens/desvantagens. No exercício em questão a implementação baseada
// em Hash table faz muito mais sentido, visto que o custo de busca de um item em uma Hash table é constante
// e em uma árvore rubro-negra é Log2(N), sendo N o número de elementos contidos no mapa.

// em C++ temos as duas implementações, onde estrutura map utliza árvore rubro-negra como implementação
// e a estrutura unordered_map utiliza o conceito de Hash table como implementação ;)

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int,int> storage;
        for (int index = 0; index < nums.size(); index++) {
            int diff = (target - nums[index]);
            if (storage.find(diff) != storage.end()) {
                return {index, storage[diff]};
            }
            storage[nums[index]] = index;
        }
        return {};
    }
};
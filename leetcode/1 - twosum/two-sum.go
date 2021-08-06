// https://leetcode.com/problems/two-sum/
// -> Challenge:
// Given an array of integers, return indices of the two numbers such that they add up to a specific target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// Example:

// Given nums = [2, 7, 11, 15], target = 9,

// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1].

// -> Solution:

package main

func twoSumQuadradic(nums []int, target int) []int {
	// Time Complexity: O(n2)
	// Space Complexity:

	// Se movimentar pela lista, depois escolher um número
	for i := 0; i < len(nums)-1; i++ {
		// Combinar esse numero com todos os outros
		for j := i + 1; j < len(nums); j++ {

			// Não precisamos validar se o indice é o mesmo
			// pois o `j` sempre esta 1 número a frente de `i`

			// Testar se a soma dos dois números é igual ao objetivo
			if nums[i]+nums[j] == target {
				// Quando achar a combinação, retornar a posição dessses números
				return []int{i, j}
			}
		}
	}

	// Retornar array vazio caso nenhum das combinações
	// derem o resultado correto
	return []int{}
}

// -> Solution:

func twoSum(nums []int, target int) []int {
	// Time Complexity: O(nlog)
	// Space Complexity: O(n)

	// Criando mapa
	seen := map[int]int{}

	for i, num := range nums {
		// Checar qual o par deste numero
		pair := target - num

		// Checa se este par do numero atual já foi visto
		if _, exists := seen[pair]; exists {
			// Já temos a resposta, retornar ambas posições
			return []int{seen[pair], i}
		}
		// Não precisamos do else, pois caso o valor acima for verdadeiro
		// a função já retornaria o resultado

		// No caso de não ter visto, guardar informação atual

		seen[num] = i
	}

	// Retornar array vazio caso nenhum das combinações
	// derem o resultado correto
	return []int{}
}

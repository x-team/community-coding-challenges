# https://leetcode.com/problems/two-sum/
# -> Challenge:
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# Example:

# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# class QuadraticSolution:
#     def twoSum(self, nums: List[int], target: int) -> List[int]:
#         # Time Complexity: O(n2)
#         # Space Complexity:
#         # Se movimentar pela lista, depois de escolher um numero
#         for i, num1 in enumerate(nums):
#         # Combinar esse numero com todos os outros
#             for j, num2 in enumerate(nums):
#                 if i != j:
#         # Testar se a soma dos dois e igual ao objetivo
#                     if num1 + num2 == target:
#         # Quando achar essa combinacao, retornar a posicao desses numeros
#                         return [i,j]
#         # Big O notation
# -> Solution:
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # Time Complexity: O(nlogn)
        # Space Complexity: O(n)
        # Criaria um mapa
        seen = {}
        # Comecar a movimentar pela lista
        for pos, num in enumerate(nums):
            # Checar qual e o par deste numero
            pair = target - num
            # Checa se este par do numero atual ja foi visto
            if pair in seen:
                # Ja temos a resposta, retornar ambas posicoes
                return [seen[pair], pos]
            # No caso de nao ter visto, guardar informacao do numero atual
            else:
                seen[num] = pos

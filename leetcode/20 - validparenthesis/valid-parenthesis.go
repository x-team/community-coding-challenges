package main

import "fmt"

func isValid(s string) bool {
	// Cria uma pilha para guardar os valores
	stack := []rune{}
	// Nós precisamos de uma lista de pares, qual símbolo fecha qual
	symbols := map[rune]rune{
		')': '(',
		']': '[',
		'}': '{',
	}
	// Vamos passar por cada simbolo, verificando se ele tem um que fecha, na ordem correta
	for _, caracter := range s {
		switch caracter {
		case '(', '{', '[':
			// Se o caracter for um símbolo de abertura, adicione ele ao stack
			stack = append(stack, caracter)
		case ')', '}', ']':
			// Se o caracter for um símbolo de fechamento, checar dois cases:
			// 1 - Se o Stack está vazio significa que estamos tentando começar fechando um par, retorne falso
			// 2 - Se o último símbolo do stack não é o par deste caracter atual, retorne falso
			if len(stack) == 0 || stack[len(stack)-1] != symbols[caracter] {
				return false
			}
			// Se não caiu no if check acima, remova o último item do stack (o par deste item)
			stack = stack[:len(stack)-1]
		}
	}
	// Após o loop se o stack estiver vazio, fechamos todos os pares. Se houver algum item no stack nós não fechamos esses caracteres
	return len(stack) == 0
}

func main() {
	fmt.Println(isValid("()[]{}")) // true
	fmt.Println(isValid("([)]"))   // false
}

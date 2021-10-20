import Foundation

/*
 Constraints:
 
 1 <= string.length <= 104
 string consists of parentheses only '()[]{}'.
 */

    
/**
 Given a string containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.
 
 An input string is valid if:
 
 1. Open brackets must be closed by the same type of brackets.
 
 2. Open brackets must be closed in the correct order.
 
 ~~~
 // Example:
 validateParentheses("()") // true
 validateParentheses("()[]{}") // true
 validateParentheses("(]") // false
 validateParentheses("([)]") // false
 validateParentheses("{[]}") // true
 ~~~
 */
func validateParentheses(_ string: String) -> Bool {
    var stack = ""
    
    let closingParentheses = ")}]"
    let openingParentheses: [Character : Character] = [
        ")" : "(",
        "}" : "{",
        "]" : "["
    ]
    
    for char in string {
        if closingParentheses.contains(char) {
            // When it's a closing parenthesis:
            // If last character is the matching opening parenthesis, pop last character
            if stack.last == openingParentheses[char] {
                stack.removeLast()
            }
            // It's invalid if:
            // 1. stack is empty (stack.last == nil)
            // 2. closing parenthesis is not a match to the opening parenthesis
            else { return false }
        }
        else { stack.append(char) } // When it's an opening parenthesis, append the character
    }
    
    // If there is any character left in stack, it means that not all parentheses were closed
    return stack.isEmpty
}

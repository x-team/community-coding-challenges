class Solution:
    def isValid(self, s: str) -> bool:
        char_open = ['(', '{', '[']
        char_close = [')', '}', ']']
        
        stack = []
        
        for character in s:
            if character in char_open:
                stack.append(character)
            else:
                if not len(stack):
                    return False

                last_char = stack.pop()
                if char_open.index(last_char) != char_close.index(character):
                    return False
        
        return not len(stack)

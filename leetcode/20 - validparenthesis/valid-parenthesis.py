class ValidParenthesis:
  def __init__(self,parenthesis):
    self.parenthesis = parenthesis
    self.symbol = { ')': '(', ']': '[', '}': '{' }
    self.stack = []

  def isValid(self):
    for character in self.parenthesis:
        if(character == '(' or character == '{' or character == '[' ):
            self.stack.append(character)
            
        if(character == ')' or character == '}' or character == ']' ):
            if (len(self.stack) == 0 or self.stack[len(self.stack) - 1] != self.symbol[character]):
                # print(self.symbol[character])
                return False;
          

            self.stack.pop()

    return len(self.stack) == 0
    
validParenthesisTrue = ValidParenthesis("()[]{}")
validParenthesisFalse = ValidParenthesis("([)]")

print(validParenthesisTrue.isValid()) #True
print(validParenthesisFalse.isValid()) #False

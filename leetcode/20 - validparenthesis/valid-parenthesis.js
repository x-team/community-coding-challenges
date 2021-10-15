const isValid = string => {
  const pairs = {'(': ')', '[': ']', '{': '}'}
  let stack = []

  for (const char of string) {
    const lastChar = stack[stack.length - 1]
    
    if (char === pairs[lastChar]) 
        stack.pop()
    else 
        stack.push(char)
  }

  return stack.length === 0
}
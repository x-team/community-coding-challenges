const isValid = (string: string): boolean => {
  let stack: string[] = [];

  const closersMap = {
    ")": "(",
    "]": "[",
    "}": "{",
  };

  while (string) {
    const char = string.charAt(0);

    if (closersMap[char] && stack[stack.length - 1] === closersMap[char]) {
      stack = stack.slice(0, -1);
    } else {
      stack.push(char);
    }

    string = string.substring(1);
  }

  if (stack.length) {
    return false;
  }

  return true;
};

console.log(isValid("()")); //true
console.log(isValid("()[]{}")); //true
console.log(isValid("(]")); //false
console.log(isValid("([)]")); //false
console.log(isValid("{[]}")); //true

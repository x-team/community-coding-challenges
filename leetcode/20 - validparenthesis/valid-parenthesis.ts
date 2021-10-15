const isValid = (string: string): boolean => {
  let stack: string = "";

  const closersMap = {
    ")": "(",
    "]": "[",
    "}": "{",
  };

  while (string) {
    const char: any = string.charAt(0);

    if (
      closersMap[char] &&
      stack.charAt(stack.length - 1) === closersMap[char]
    ) {
      stack = stack.slice(0, -1);
    } else {
      stack += char;
    }

    string = string.substring(1);
  }

  if (stack) {
    return false;
  }

  return true;
};

console.log(isValid("()")); //true
console.log(isValid("()[]{}")); //true
console.log(isValid("(]")); //false
console.log(isValid("([)]")); //false
console.log(isValid("{[]}")); //true

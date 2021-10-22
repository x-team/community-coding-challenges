var isValid = function (s) {
  var stack = [];
  var dict = [];

  dict.push({ key: "(", value: ")" });
  dict.push({ key: "[", value: "]" });
  dict.push({ key: "{", value: "}" });

  const found = dict.find(element => element.key === '(');

  for (const character of s) {
    switch (character) {
      case '(':
      case '[':
      case '{':
        stack.push(dict.find(element => element.key === character));
        break;
      case ')':
      case ']':
      case '}':
        const foundCharacter = dict.find(element => element.value === character);
        if (stack.length === 0 || stack[stack.length - 1] != foundCharacter) {
          return false;
        }

        stack.pop();
        break;
    }
  }

  return stack.length === 0;

};

console.log(isValid('()[]{}')); // true
console.log(isValid('([)]')); // false
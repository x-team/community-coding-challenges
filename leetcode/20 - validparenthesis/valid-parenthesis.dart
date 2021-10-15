Map<String, String> symbols = {
  ")": "(",
  "}": "{",
  "]": "[",
};

bool isValid(String s) {
  List<String> opens = [];
  for (String char in s.split('')) {
    if (symbols.values.contains(char)) {
      opens.add(char);
    } else {
      if (opens.isEmpty || symbols[char] != opens.last) return false;
      opens.removeLast();
    }
  }
  return opens.isEmpty;
}

main(List<String> args) {
  print(isValid("()"));       // true
  print(isValid("()[]{}"));   // true
  print(isValid("(]"));       // false
  print(isValid("([)]"));     // false
  print(isValid("{[]}"));     // true
}
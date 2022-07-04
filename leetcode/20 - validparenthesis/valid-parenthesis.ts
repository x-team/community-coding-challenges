class ValidParenthesis {
  private stack: Array<string>;
  private symbol: Object;
  private parenthesis: string;
  constructor(parenthesis: string) {
    this.stack = [];
    this.symbol = { ")": "(", "]": "[", "}": "{" };
    this.parenthesis = parenthesis;
  }

  public isValid(): boolean {
    for (let character of this.parenthesis) {
      switch (character) {
        case "(":
        case "{":
        case "[":
          this.stack.push(character);
          break;

        case ")":
        case "}":
        case "]":
          if (
            this.stack.length === 0 ||
            [...this.stack].pop() !== this.symbol[character]
          ) {
            return false;
          }

          this.stack.pop();
          break;
      }
    }
    return this.stack.length === 0;
  }
}

const parenthesisTrue = new ValidParenthesis("()[]{}");
const parenthesisFalse = new ValidParenthesis("([)]");

console.log({
  parenthesisFalse: parenthesisFalse.isValid(), // false
  parenthesisTrue: parenthesisTrue.isValid(), // true
});

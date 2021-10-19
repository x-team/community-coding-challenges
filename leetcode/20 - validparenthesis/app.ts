function isValid(s: string): boolean {

    if(s.length % 2 !== 0) return false

    const arrayCharacters: string[] = s.split('')
    const stack: string[] = []

    for (const c of arrayCharacters) {
        if (c === '(')
            stack.push(')')
        else if (c === '{')
            stack.push('}')
        else if (c === '[')
            stack.push(']')
        else if (stack.length === 0 || stack.pop() !== c)
            return false
        // console.log(`char: "${c}" --- stack: "[ ${stack} ]"`)
    }
    return stack.length === 0
}

console.log(isValid('()'))        // true
console.log(isValid('()[]{}'))  // true
console.log(isValid('({)[]}'))  // false
console.log(isValid('(]'))      // false
console.log(isValid('([)]'))    // false
console.log(isValid('{[]}'))    // true
console.log(isValid('{][}'))    // false
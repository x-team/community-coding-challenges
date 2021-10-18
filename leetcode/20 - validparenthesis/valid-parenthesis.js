const isValid = (s) => {
    //cria uma expressão regular para substituir todos os () {} [] por branco
    const pattern = /\(\)|{}|\[\]/g
    let result = s.replace(pattern,(x)=>x='')

    // efetua a ação até não haver mais correspondência
    while (pattern.test(result)) {
        result = result.replace(pattern,(x)=>x='')
    }

    // verdadeiro se o resultado estiver vazio caso contrário é falso
    return result === ''
}

//testes 
console.log(isValid('(){[]}(){]}')) // false
console.log(isValid("()[]{}")) // true
console.log(isValid("([])]"))   // false
package Algoritms

object ValidParenthesis extends App {

  def validSequence(chr: Char, head: Char): Boolean = {
    chr == ')' && head == '(' || chr == ']' && head == '[' || chr == '}' && head=='{'
  }

  def isValid(s: String): Boolean = {
    s.foldLeft(List[Char]()) ((accumulator, chr) => {
      chr match {
        case '(' | '{' | '[' => chr :: accumulator
        case ')' | '}' | ']' => accumulator match {
          case head :: tail => if (!validSequence(chr, head)) return false else tail
        }
      }
    }).isEmpty
  }

  println(isValid("()[]{}")) // true
  println(isValid("([)]")) // false
  println(isValid("([{}])")) // true

}

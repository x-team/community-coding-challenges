package Algoritms;

import java.util.ArrayDeque;
import java.util.Deque;

public class ValidParenthesis {

    public static void main(String[] args) {

        System.out.println(isValid("()[]{}")); // true
        System.out.println(isValid("([)]"));   // false
        System.out.println(isValid("([{}])")); // true
    }

    private static boolean isValid(String s) {
        Deque<Character> stack = new ArrayDeque<>();

        for (int i = 0; i < s.length(); i++) {
            char item = s.charAt(i);

            if (item == '(' || item == '{' || item == '[') {
                stack.push(item);
                continue;
            }

            if (stack.isEmpty()) {
                return false;
            }

            char valid = stack.pop();
            switch (item) {
                case ')':
                    if (valid == '{' || valid == '[') return false;
                    break;
                case '}':
                    if (valid == '(' || valid == '[') return false;
                    break;
                case ']':
                    if (valid == '(' || valid == '{') return false;
                    break;
            }
        }

        return stack.isEmpty();
    }
}

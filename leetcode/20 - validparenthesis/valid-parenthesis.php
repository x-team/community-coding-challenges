<?php

class ValidParenthesisSolution {

    /**
     * @param String $s
     * @return Boolean
     */
    function isValid($s) {
        $stack = [];
        $symbols = [
            ')' => '(',
            ']' => '[',
            '}' => '{'
        ];
        
        for ($index = 0; $index < strlen($s); $index++) {
            $character = $s[$index];
            switch ($character) {
                case '(':
                case '[':
                case '{':
                    $stack[] = $character;
                    break;
                case ')':
                case ']':
                case '}':
                    if (count($stack) === 0 || $stack[count($stack)-1] !== $symbols[$character]) {
                        return false;
                    }
                    
                    array_pop($stack);
                    break;
            }
        }
        
        return count($stack) === 0;
    }
}
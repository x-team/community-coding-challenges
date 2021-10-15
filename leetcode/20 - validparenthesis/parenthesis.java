class Solution {
    public boolean isValid(String s) {
        Stack<Character> stack = new Stack<Character>();
        Map<Character, Character> symbols = Map.of('(', ')', '{', '}', '[', ']');
        
        for(char character : s.toCharArray()){
            if(symbols.keySet().contains(character)){
                stack.push(character);
            }else if (stack.isEmpty() || symbols.get(stack.pop()) != character){
                return false;
            }
        }
        return stack.size() == 0 ? true : false;
        
    }
}
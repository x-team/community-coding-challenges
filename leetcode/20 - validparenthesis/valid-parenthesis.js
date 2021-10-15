const OBJECT_MAPPING = {
  ')': '(',
  ']': '[',
  '}': '{',
}

var isValid = function (s) {
  const opens = []
  for (c of s) {
    if (c === '(' || c === '[' || c === '{') {
      opens.push(c)
    } else {
      if (opens.length === 0) {
        return false;
      }
      const lastOpen = opens[opens.length - 1];
      if (OBJECT_MAPPING[c] != lastOpen) {
        return false
      } else {
        opens.pop();
      }
    }
  }

  return opens.length === 0
};
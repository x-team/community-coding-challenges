/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function (s) {
	if (s.length <= 1) return false;

	const left = '{[(';

	let stack = [];

	for (let i = 0; i < s.length; i++) {
		if (left.indexOf(s[i]) >= 0) {
			stack.push(s[i]);
		} else {
			if (stack.length === 0) return false;
			const last = stack.pop();
			const pair = `${last}${s[i]}`;
			if (pair !== '{}' && pair !== '[]' && pair !== '()') return 0;
		}
	}

	return stack.length === 0;
};

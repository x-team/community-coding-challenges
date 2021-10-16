<?php

class Solution
{
	function isValid($s)
	{
		$stack = [];

		$symbols = [
			")" => "(",
			"]" => "[",
			"}" => "{"
		];

		while ($s) {
			if ($symbols[$s[0]]) {
				$char = array_pop($stack);

				if ($char != $symbols[$s[0]]) {
					return false;
				}
			} else {
				array_push($stack, $s[0]);
			}

			$s = substr($s, 1);
		}

		if (count($stack)) {
			return false;
		}

		return true;
	}
}

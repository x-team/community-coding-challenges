<?php

class Solution
{
    public function twoSum(array $nums, int $target): array
    {
        $seen = [];
        foreach ($nums as $pos => $num) {
            $pair = $target - $num;
            if (isset($seen[$pair])) {
                return [$seen[$pair], $pos];
            }
            $seen[$num] = $pos;
        }
    }
}

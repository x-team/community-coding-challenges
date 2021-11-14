function TwoSumQuadradic(nums, target)
    for i = 1, #nums do
        for j = i + 1, #nums do
            if nums[i] + nums[j] == target then 
                return i, j 
            end
        end
    end

    return nil
end

function TwoSum(nums, target)
    local seen = {}

    for i, num in ipairs(nums) do
        if seen[num] then 
            return seen[num], i 
        end
        seen[target - num] = i
    end

    return nil
end

local nums = {2, 15, 11, 7}
local target = 9

print(TwoSumQuadratic(nums, target))
print(TwoSum(nums, target))

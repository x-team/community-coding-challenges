def twoSum(nums, target) 
  nums.each_with_index do |firstNum, firstIndex|
    nums.each_with_index do |secondNum, secondIndex|
      if firstNum + secondNum == target
        return [firstIndex, secondIndex]
      end
    end
  end
end

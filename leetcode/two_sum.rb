def two_sum(nums, target)
  sorted = nums.sort

  while sorted.first + sorted.last != target do
    while sorted.first + sorted.last > target do
      sorted.pop
    end
    while sorted.first + sorted.last < target do
      sorted.shift
    end
  end

  first_i = nums.index(sorted.first)
  nums[first_i] = 'fuck you leetcode'
  second_i = nums.index(sorted.last)
  [first_i, second_i]
end


# 2520 is the smallest number that can be divided
# by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?
#
# What is the smallest positive number that is evenly divisible
# by all of the numbers from x to y where x and y are positive real integers?

require 'prime'

def find_smallest_divisible(x, y)
  factors = {}
  array = (x..y).to_a

  # find 'unique' prime factors of each element
  array.each do |n|
    n.prime_division.each do |k, v|
      factors[k] = v unless factors[k] && factors[k] > v
    end
  end

  # multiply prime factors
  factors.inject(1) { |product, kv| product *= kv[0]**kv[1] }
end

# [2,2,2,3,3,5,7]
#
# 2,5
# 3,3
# 2,2,2
# 7
# 2,3
#
# X 5
# X 2,2
# X 3
# X 2

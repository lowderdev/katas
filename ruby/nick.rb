def nick
  arr = [1, 2]

  def add_another(arr)
    arr[-1] + arr[-2]
  end

  while arr[-1] < 4000000
    arr << add_another(arr)
  end

  arr = arr[0..-2].select { |num| num.even? }
  sum = arr.reduce(:+)
end

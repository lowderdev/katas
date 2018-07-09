def pattern(n)
  length = n * 2 - 1
  (1..n).map do |i|
    ascend = (1..i).map { |j| j % 10 }.join
    descend = ascend.reverse[1..-1]
    (ascend + descend).center(length)
  end.join("\n")
end

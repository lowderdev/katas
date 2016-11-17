


def max_area(height)
  rally_point = [height.first, height.last].min
  (1...height.length-1).each do |i|
    height[i] = 0 if height[i] < rally_point
  end

  results = []
  (0...height.length).each do |i|
    ((i+1)...height.length).each do |j|
      results << [height[i], height[j]].min * (j - i)
    end
  end
  results.max
end

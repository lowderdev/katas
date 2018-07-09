# Dixon
def longest_common_prefix(strings)
  return '' if strings.empty?
  min = strings.min
  for i in 0...min.length
    char = min[i]
    for j in 0...strings.length
      return min[0...i] if strings[j][i] != char
    end
  end
  min
end

# Genius
def longest_common_prefix(strings)
  strings.inject do |longest, string|
    longest = longest.chop while longest != string[0...longest.length]
    longest
  end
end

# Logan
def longest_common_prefix(strings)
  return strings[0] if strings.count == 1
  return '' if strings.empty? || strings[0].empty?
  index = 0
  bool = true
  max = strings.count - 1
  min = strings.min.length

  while bool == true
    (1..max).each do |i|
      bool = strings[0][index] == strings[i][index]
      break unless bool
    end
    break if bool == false || index == min
    index += 1
  end
  index -= 1
  return '' if index < 0
  strings[0][0..index]
end

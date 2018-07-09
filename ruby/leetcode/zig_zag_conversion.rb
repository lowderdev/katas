def convert(s, num_rows)
  return '' if num_rows < 1
  return s if num_rows == 1
  hash = {}
  num_rows.times do |n|
    hash[n] = []
  end
  zig = 0
  i = 0
  while i < s.length do
    while zig < num_rows do
      hash[zig] << s[i]
      i += 1
      zig += 1
      break if i == s.length
    end
    break if i == s.length
    zig -= 2
    while zig >= 0 do
      hash[zig] << s[i]
      i += 1
      zig -= 1
      break if i == s.length
    end
    zig += 2
    i += 1
    break if i == s.length
  end
  puts hash
  hash.values.flatten.compact.join('')
end
convert('PAYPALISHIRING', 3)

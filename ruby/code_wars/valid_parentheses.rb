def valid_parentheses(string)
  count = 0
  string.chars.each do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    return false if count < 0
  end
  count == 0
end

def valid_parentheses(string)
  !!(Regexp.new(string)) rescue false
end

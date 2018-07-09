def match(word, candidates)
  candidates.each do |candidate|
    return candidate if candidate.downcase.split('').sort == word.downcase.split('').sort
  end
end

match('dog', ['asdf', 'GoD'])


def strip_vowels(string, acc = "")
  vowels = 'aeiou'.split('')
  return acc if string.length <= 0

  if vowels.include? string[0].downcase
    strip_vowels(string[1..-1], acc)
  else
    strip_vowels(string[1..-1], acc + string[0])
  end
end

puts strip_vowels("harry")

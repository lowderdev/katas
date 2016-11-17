# Find the largest highly composite number upto and including ceiling

def find(ceiling)
  h = {}
  (2..ceiling).each do |n|
    mults = 0
    h["#{n}"] = {}
    h["#{n}"]['array'] = []
    (2..n).each do |i|
      if n % i == 0
        h["#{n}"]['array'] << i
        mults += 1
      end
    end
    h["#{n}"]['mults'] = mults
  end
  biggest_key = 2
  h.keys.each do |k|
    biggest_key = k if h["#{k}"]['mults'].to_i > h[biggest_key.to_s]['mults'].to_i
  end
  [biggest_key, h]
end

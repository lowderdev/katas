class Multiples
  def initialize(range)
    @range = range
  end

  def get_multiples_of_3_and_5(x)
    (3..x).to_a.select { |i| i % 3 == 0 || i % 5 == 0 }
  end

  def get_multiples_of(*args)
    multiples = []
    args.each do |x|
      multiples << (1..@range).to_a.select { |i| i % x == 0 }
    end
    multiples.flatten.uniq.sort
  end
end

class Multiples
  attr_accessor :range

  def initialize(range = 1000)
    @range = range
  end

  def simple
    (1...1000).select { |i| i % 3 == 0 || i % 5 == 0 }.reduce(:+)
  end

  def dixon_simple
    sum = 0
    (1..333).each { |i| sum += i*3 }
    (1...200).each { |i| sum += i*5 if i*5 % 3 != 0 }
    sum
  end

  def get_sum_of_dixon_multiples(x, y, z)
    sum = 0
    (1..@range/x).each { |i| sum += i*x }
    (1..@range/y).each { |i| sum += i*y if i*y % x != 0 }
    (1..@range/z).each { |i| sum += i*z if i*z % y != 0 && i*z % x != 0 }
    sum
  end

  def get_sum_of_logan_multiples(x, y, z)
    sum = 0
    (1..@range).each { |i| sum += i if i % x == 0 || i % y == 0 || i % z == 0 }
    sum
  end

  def get_sum_of_multiples(*args)
    multiples = []
    args.each do |x|
      (1..@range/x).each { |i| multiples << i*x }
    end
    multiples.uniq.reduce(:+)
  end

  def get_sum(*args)
    sum = 0
    (1..@range).each { |i| sum += i if check(i, args) }
    multiples.reduce(:+)
  end

  private
    def check(i, args)
      puts i
      i % args.shift == 0 || (args.length > 1 ? check(i, args) : false)
    end
end

class Bench
  def self.first
    Benchmark.bm do |x|
      x.report {
        Multiples.new(100000).get_sum_of_multiples(3,5,7)
      }
    end
  end


  def self.second
    Benchmark.bm do |x|
      x.report {
        Multiples.new(100000).dynamic_sum(101, 102, 103)
      }
    end
  end
end

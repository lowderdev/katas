# "Nugget o' gold" - Dixon Adair, 2016
# { ceiling: 6857, factors: [71, 839, 1471] }

def doit(ceiling = 600851475143)
  array = []
  n = Math.sqrt(ceiling).to_i
  i = 0
  until i == 5
    (n..ceiling/2).each do |num|
      if ceiling % num == 0
        array << num
      end
      i += 1
    end
  end
end

def sieve(ceiling)
  range = (2..ceiling).to_a
  (2..ceiling).each do |num|
    range -= (2..ceiling/num).map { |i| i * num }
  end
  range
end

def prime_factors(ceiling = 215370645, x = 1000)
  factors = []
  until ceiling == 1
    primes = Prime.each(x *= 3)
    primes.each do |prime|
      while ceiling % prime == 0
        factors << prime
        ceiling /= prime
      end
      break if ceiling == 1
    end
    puts "#{{ ceiling: ceiling, factors: factors }}"
  end
  { ceiling: ceiling, factors: factors }
end

class Bench
  @ceiling = 10000

  def self.first(ceiling = @ceiling)
    Benchmark.bm do |x|
      x.report {
        sieve(ceiling)
      }
    end
  end

  def self.second(ceiling = @ceiling)
    Benchmark.bm do |x|
      x.report {
        generate_primes(ceiling)
      }
    end
  end
end

# def generate_primes(ceiling)
#   primes = []
#   (2..ceiling).each do |n|
#     primality = true
#     (2..n/2).each do |n2|
#         primality = false && break if n % n2 == 0
#       end
#     primes << n if primality == true
#   end
#   primes
# end

# def prime_factors(num)
#   factors = []
#   primes_to_test = generate_primes(num/2)
#   for prime in primes_to_test
#     if num % prime == 0
#       factors << prime
#       num = num/prime
#       primes_to_test.unshift(0)
#     end
#   end
#   factors
# end

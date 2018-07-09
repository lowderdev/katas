class Bench
  def self.first
    Benchmark.bm do |x|
      x.report {

      }
    end
  end


  def self.second
    Benchmark.bm do |x|
      x.report {

      }
    end
  end
end

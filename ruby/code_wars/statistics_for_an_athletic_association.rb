# strg = "01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17"

def stat(strg)
  return '' if strg.empty?

	results = []
  strg.split(',').each do |result|
    h_m_s = result.split('|').map(&:to_i)
    results << (h_m_s[0] * 3600 + h_m_s[1] * 60 + h_m_s[2])
  end
  results.sort!
  length = results.length

  range = results[-1] - results[0]
  average = results.reduce(&:+) / length
  median = (results[(length - 1) / 2] + results[length / 2]) / 2

  "Range: #{format_time(range)} Average: #{format_time(average)} Median: #{format_time(median)}"
end

def format_time(time)
  Time.at(time).utc.strftime("%H|%M|%S")
end

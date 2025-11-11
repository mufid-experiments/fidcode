def solution(n, s)
  count = 0
  upper = 10**n
  (0..((upper)-1)).each do |i|
    if i.to_s.chars.map(&:to_i).sum == s
      puts i
      count += 1
    end
  end
  count
end

puts solution(*ARGV.map(&:to_i))

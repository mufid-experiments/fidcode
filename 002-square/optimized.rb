def solution(arr)
  h, w = arr.size, arr[0].size
  result = []
  max_side = 0
  (h+1).times do |hi|
    result << []
    (w + 1).times { result[hi] << 0 }
    next if hi == 0

    (1..w).each do |j|
      if arr[hi - 1][j - 1] == 1
        result[hi][j] = 1 + [result[hi - 1][j], result[hi][j - 1], result[hi - 1][j - 1]].min
        max_side = [max_side, result[hi][j]].max
      else
        result[hi][j] = 0
      end
    end
  end
  debug 'arr ----'
  debug arr
  debug ''
  debug 'result ----'
  debug result
  max_side*max_side
end

def debug(s)
  if s.is_a?(String)
    return puts s
  end

  s.each do |arr|
    puts arr.join("\t")
  end
end

h, w = gets.split(' ').map(&:to_i)

arr = []
(1..h).each { arr << gets.split(' ').map(&:to_i) }

puts solution(arr)


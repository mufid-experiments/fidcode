require 'table_print'
require 'ostruct'

def tpp(dp)
    tp.set OpenStruct, :i, :s0, :s1, :s2, :s3, :s4
  i = -1
  os = dp.map { |row| OpenStruct.new(i: i+=1 , s0: row[0], s1: row[1], s2: row[2], s3: row[3], s4: row[4]) }
  tp os
end

def solution(n, s)
    return 0 if s < 0 || s > 9 * n

    dp = []
    (0..n).each do |i|
      dp[i] = []
      (0..s).each do |j|
        dp[i] << 0
      end
    end
    (0..9).each do |i|
        dp[1][i] = 1
    end
    dp[0][0] = 1
    return dp[1][s] if s == 1
    (2..n).each do |i|
        (0..s).each do |j|
            t=[9,j].min
            sum = []
            (0..t).each do |d|
              
                sum << (dp[i-1][j-d] || 0)
            end
            puts sum.inspect
            puts '---'
            dp[i][j] = sum.sum
            tpp dp
        end
    end

    tpp dp

    return dp[n][s]
  end
  
  puts solution(*ARGV.map(&:to_i))
  
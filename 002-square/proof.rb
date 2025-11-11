def solution(arr)
  solution = []
  arr.each_with_index do |_, start_y|
    solution << inner(arr, 0, start_y)
  end
  side = solution.max
  side*side
end

def inner(arr, start_x, start_y)
  return 0 if start_x >= arr[0].size

  arr_side_max = [arr.size, arr[0].size].max
  current_solution = 0

  (0..arr_side_max).each do |iter|
    next if start_x + iter >= arr[0].size
    next if start_y + iter >= arr.size

    current_solution = (iter+1) * (iter+1) if all_one?(arr, start_x, start_y, iter)   
  end

  [current_solution, inner(arr, start_x + 1, start_y)].max
end

def all_one?(arr, start_x, start_y, iter)
  (start_y..(start_y + iter)).each do |y|
    return false if arr[y][start_x..(start_x + iter)].uniq != [1]
  end
  true
end

h, w = gets.split(' ').map(&:to_i)

arr = []
(1..h).each { arr << gets.split(' ').map(&:to_i) }

puts solution(arr)


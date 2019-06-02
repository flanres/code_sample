def search_max(array)
  max = array[0]
  index = 0
  minus_flg = 0
  array.length.times { |i|
    if array[i] == "-"
      minus_flg = 1
      next
    end
    if minus_flg == 1 && array[i] == ","
      minus_flg = 0
      next
    end
    if minus_flg == 1
      next
    end
    if max < array[i]
      max = array[i]
      index = i
    end
  }
  return max.to_i, index
end

data_max = 1
input = gets

if input.length < 3
  puts "-1"
  exit
end

3.times{ |k|
  data_calc, max_index = search_max(input)
  data_max = data_max * data_calc
  input[max_index] = "0"
}

puts data_max

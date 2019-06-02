input = gets
count = 1

input.length.times { |index|
  if index != 0 && count % 3 == 0
    if input[index] == "-" && input[index] == "."
        count = count - 1
    end
    input.insert(index, ",")
  end
  count = count + 1
}

puts input

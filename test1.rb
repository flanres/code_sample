#input = gets.chomp.split
File.open('log.txt') do | file |
    # pull request test
    test_array = []
    result = []
    file.each_line do | in_data |
        test_array.push(in_data)
        num = array.length-1
        result.push(test_array[num].to_i - test_array[num-1].to_i)
    end
    result.shift
    puts result
end


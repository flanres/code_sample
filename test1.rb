#input = gets.chomp.split
File.open('log.txt') do | file |
    # test change
    array = []
    result = []
    file.each_line do | in_data |
        array.push(in_data)
        num = array.length-1
        result.push(array[num].to_i - array[num-1].to_i)
    end
    result.shift
    puts result
end


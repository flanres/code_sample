#rco_test1.rb
# coding: utf-8
class Analyze_regex
    attr_accessor :input, :length
    def initialize(input, input_length, regex_str, regex_length)
        @input_str = input
        @str_length = input_length
        @regex_str = regex_str
        @regex_length = regex_length - 1
        @serch_str_buf = []
        @period_flg = 0
        @asta_flg = 0
        @qes_flg = 0
        @literal_flg = 0

    end

    def analyze()
        for regex_index in 0..@regex_length do
            if @regex_str.slice(regex_index) == "."
                    @period_flg = 1
                if regex_str.slice(regex_index + 1) == "*"
                    @asta_flg = 1
                elsif regex_str.slice(str_index + 1) == "?"
                    @qes_flg = 1
                end

            elsif @regex_str.slice(regex_index) == "*"
                asta_search_result = search_char(@regex_str.slice(regex_index - 1))
            elsif @regex_str.slice(regex_index) == "?"
                qes_search_result = search_char(@regex_str.slice(regex_index - 1))
            else
                @literal_flg = 1
                # Literal only && 1 word
                if (regex_index == @regex_length) && \
                   (@period_flg == 0) && \
                   (@asta_flg == 0) && \
                   (@qes_flg == 0) && \
                   (@literal_flg == 1)
                    @serch_str_buf.push(search_char(@regex_str[regex_index]).shift)
                    if @serch_str_buf == nil
                    # Serch result is nothing
                        return false
                    else
                        return @serch_str_buf
                    end
                end
                @serch_str_buf.push(search_char(@regex_str[regex_index]).shift)
            end
        end
    end

    def search_char(char)
        array_result = []
        for str_index in 0..@str_length do
            if @input_str.slice(str_index) == char
                array_result.push(str_index)
            end
        end
        return array_result
    end

    def period_mod()
    
    end
end

# Main
# Input test character
input_str = gets.chomp
# Input Regular expression
regex_str = gets.chomp

# Set length
str_length = input_str.chomp.length
regex_length = regex_str.chomp.length

regex = Analyze_regex.new(input_str, str_length, regex_str, regex_length)
#search_result_index = regex.search_char(regex_str)
result = regex.analyze()
result_length = result.length
puts "検索結果を出力します"
puts "result : #{result}"

# Search_NG
if result == false
    puts -1
# Search_OK
else
    for result_index in 0..result.length - 1 do
        # regex = 1 word && Search result is Multiple
        if regex_length == 1
            shift_index = result.shift.to_i
            print input_str[shift_index]
            break
        end

        shift_index = result.shift.to_i
        print input_str[shift_index]
    end
    puts ""
end

puts "一致桁数は : #{result_length}です"
puts "正規表現 : #{input_str.match(/#{regex_str}/)}"

#for str_index in 0..str_length do
#    puts input_str.slice(str_index)
#    puts regex_str.slice(str_index)
#end



#    puts input_str.slice(str_index)
#    puts regex_str.slice(str_index)


#puts input_str
#puts str_length
#puts str_bytelength
#puts input_str[0, 3]


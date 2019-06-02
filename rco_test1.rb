#rco_test1.rb
# coding: utf-8
class Analyze_regex
    attr_accessor :input_str, :regex_str , :search_str_buf
    def initialize(input, regex_str)
        @input_str = input
        @regex_str = regex_str
        @search_str_buf = []
        @period_flg = 0
        @asta_flg = 0
        @qes_flg = 0
        @literal_flg = 0

    end

    def analyze()
        @regex_str.length.times { |regex_index|
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
                qes_search_result = search_char(@regex_str[regex_index - 1])
                if qes_search_result != []
                    puts "###nill check### qes : #{qes_search_result}"
                    @search_str_buf.push(search_char(@regex_str[regex_index - 1]).shift)
                end
                if (regex_index == @regex_str.length - 1)
                    check_index()
                    return @search_str_buf
                end
            else
                @literal_flg = 1
                # Literal only && 1 word
                if (regex_index == @regex_str.length - 1) && \
                   (@period_flg == 0) && \
                   (@asta_flg == 0) && \
                   (@qes_flg == 0) && \
                   (@literal_flg == 1)
                    literal_search_result = (search_char(@regex_str[regex_index]).shift)               
                    #@search_str_buf.push(search_char(@regex_str[regex_index]).shift)
                    if literal_search_result == nil
                    # Serch result is nothing
                        return @search_str_buf
                    else

                        return @search_str_buf.push(literal_search_result)
                    end
                end

                literal_search_result = (search_char(@regex_str[regex_index]).shift)               

                if literal_search_result != nil
                    puts "####push####literal_s_resu : #{literal_search_result}"
                    @search_str_buf.push(literal_search_result)
                else
                    puts "not mutch"
#                    @search_str_buf.pop
                end
                #@search_str_buf.push(search_char(@regex_str[regex_index]).shift)
            end
        }
    end

    def search_char(char)
        array_result = []
        @input_str.length.times { |str_index|
            if @input_str[str_index] == char
                array_result.push(str_index)
            end
        }
        puts "array_result : #{array_result}"
        return array_result
    end

    def check_index()
        @search_str_buf.length.times { |buf_index|
            if @search_str_buf.count(@search_str_buf[buf_index]) > 1
                puts "buf_index : #{buf_index}"
                @search_str_buf.delete_at(buf_index)
            end
        }
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

regex = Analyze_regex.new(input_str, regex_str)
#search_result_index = regex.search_char(regex_str)
result = regex.analyze()
result_array_length = result.length

puts "検索結果を出力します"
puts "result : #{result}"

# Search_NG
if result == [nil] || result == []
    puts -1
    exit
# Search_OK
else
    result.length.times { |result_index|
        # regex = 1 word && Search result is Multiple
        if regex_str.chomp.length == 1
            shift_index_int = result.shift.to_i
            print input_str[shift_index_int]
            break
        end
#        if result[result_index] != nil
            shift_index_int = result.shift.to_i
            print input_str[shift_index_int]
#        else
 #           puts "delete_at"
  #          result.delete_at(result_index)
   #     end
    }
    puts ""
end

puts "一致桁数は : #{result_array_length}です"
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


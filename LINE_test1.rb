test_str1 = "foo"
test_str2 = "bar"
test_str3 = "baz"
count = 0

input_str = gets

if nil != input_str.match(/#{test_str1}/)
  count = count + 1
end

if nil != input_str.match(/#{test_str2}/)
  count = count + 1
end

if nil != input_str.match(/#{test_str3}/)
  count = count + 1
end 

puts count
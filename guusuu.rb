require 'pry'
num=gets.to_i
ai=gets.split(" ").map(&:to_i)
res=[]
i=0
while i<num
binding.pry
  res[ai[i]-1]=i+1
  i+=1
end
puts res.join(" ")
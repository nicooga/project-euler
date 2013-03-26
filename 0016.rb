# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 21000?

def solution(n)
  n.to_s.split(//).inject(1) { |a,d| a + d.to_i }
end

puts "Solution: #{solution(2**1000)}"
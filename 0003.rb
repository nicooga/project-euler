# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

include Math

def solution(n)
  prime = n
  (2..sqrt(n).to_i).each do |i|
    next if i.even?
    break if i >= prime
    prime /= i while (prime > i && (prime%i).zero?)
  end
  prime
end

puts "Solution: #{solution(600851475143)}"
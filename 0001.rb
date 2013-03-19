# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def solution(n)
  (1..(n-1)).to_a.select do |n|
    ((n%3).zero?) || ((n%5).zero?)
  end.reduce(:+)
end

puts "Solution: #{solution(1000)}"
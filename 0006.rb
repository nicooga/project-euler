# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def solution(range)
  squares_sum = range.map { |n| n ** 2 }.reduce(:+)
  sum_squared = range.to_a.reduce(:+) ** 2
  sum_squared - squares_sum
end

puts "Solution: #{solution(1..100)}"
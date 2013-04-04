# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require_relative 'stuff/perfect.rb'
require 'set'

def solution
  abundant_numbers = (12..28123).select(&:abundant?)
  inverse_set = abundant_numbers.each.with_index.inject([]) do |a,(n,index)|
    a.concat(
      abundant_numbers[index..abundant_numbers.size-1]
      .take_while { |i| (n+i) <= 28123 }.map { |i| n+i }
    )
  end.uniq.to_set
  solution_set = (1..28123).to_set - inverse_set
  solution_set.reduce(:+)
end

puts "Solution: #{solution}"
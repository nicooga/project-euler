# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require_relative 'stuff/numbers'
require 'awesome_print'

def solution
  factorial = Hash[Array.new(10) { |i| [i, i.factorial] }]
  (3..(2_540_160)).select do |n|
    print "\r #{n}"
    n.digit_factorialization_sum == n
  end
end

ap solution

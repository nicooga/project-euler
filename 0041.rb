# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# What is the largest n-digit pandigital prime that exists?

require 'prime'

def solution
  # concatenate digits "the math" way [a..c] => abc
  digits_to_n = ->(digits) do
    digits.map.with_index.inject(0) do |p,(d,pot)|
      p += d * (10**(digits.size-pot-1))
    end
  end

  digits_to_n.call(
    # Array#permutations does the hard work though
    # it isn't hard to do a custom implementation
    [7,6,5,4,3,2,1].permutation.find do |digits|
      digits_to_n[digits].prime?
    end
  )
end

puts "Solution: #{solution}"

# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

require_relative 'stuff/numbers'
require 'awesome_print'

def solution
  nums = []
  (10..99).each do |n|
    (10..99).each do |d|
      if !([n, d].any? { |i| i.divisible_by? 10 }) && n != d && n < d && n.digits != d.digits.sort && n.shares_digit_with?(d)
        sd = n.shared_digit d
        expected = n.to_f / d
        real = n.substract_digit(sd).to_f / d.substract_digit(sd)
        nums << Rational(n,d) if expected == real
      end
    end
  end
  nums.reduce(:*).denominator
end

# puts "Solution: #{solution}"
ap solution

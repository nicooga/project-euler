# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

require 'awesome_print'

class String
  def possible_sums_a
    0.upto(size-3).map do |i|
      [self[0..i].to_i, self[(i+1)..(-1).to_i]]
    end
  end

  def possible_sums_b
    0.upto(size-2).map do |i|
      [self[0..i].to_i, self[(i+1)..(-1)].to_i]
    end
  end
end

def solution
  sum = {}

  (1..9).to_a.permutation.with_index do |p, i|
    p.join.possible_sums_a.each do |ps|
      ps.last.possible_sums_b.each do |n|
        a, b, c = [ps.first, n].flatten.map &:to_i
        sum[c] ||= true if (a * b) == c
      end
    end
    print "\rPermutation ##{i+1} | Found ##{sum.size} products..."
  end

  sum.map(&:first).reduce(:+)
end

puts "Solution: #{solution}"

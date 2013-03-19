# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require 'awesome_print'

def pitagoric_triplet?(a,b,c)
  (a**2 + b**2) == c**2
end

def solution
  triplet = []
  997.downto(334) do |c|
    range = (1..(1000-c)).to_a
    a_values = range.size.even? ? range[0...(range.size/2-1)] : range[0...(range.size/2)]
    b_values = range[(range.size/2)...(range.max-1)].reverse
    ab_pairs = a_values.zip(b_values)
    triplet = ab_pairs.select { |a,b| pitagoric_triplet?(a,b,c) }.map{ |a,b| [a,b,c] }
    break if triplet.any?
  end
  triplet.first.reduce(:*)
end

puts "Solution: #{solution}"
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
# {20,48,52}, {24,45,51}, {30,40,50}
# For which value of p ≤ 1000, is the number of solutions maximised?

require 'set'
require 'pry'

def solution(max_p = 1000)
  # Iterate over all evens up to max_p
  (1..(max_p/2)).lazy.map { |x| 2 * x }.max_by do |p|
    # Given a < b < c, then a can be as big as floor(p/3)
    # Count numebr of pythagorean triplets whose sum is p
    (1..(p/3)).count do |a|
      b = (p**2 - 2*p*a) / (2*p - a).to_f
      b.to_i == b
    end
  end
end

puts "Solution: #{solution}"

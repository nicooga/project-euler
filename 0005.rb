# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def solution(range)
  ary = range.select(&:prime?).map do |n|
    n**Math.log(range.max, n).floor
  end.reduce(:*)
end

class Numeric
  def prime?
    return false if self < 2
    not (2..Math.sqrt(self).floor).to_a.any? { |n| divisible_by?(n) }
  end

  def divisible_by?(n); (self%n).zero?; end
end

puts "Solution: #{solution(1..20)}"
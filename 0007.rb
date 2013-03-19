# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

def solution(ceiling=10)
  n = 1
  count = 0
  until count == ceiling
    n += 1
    next if n > 2 && n.even?
    next if not n.prime?
    count += 1
  end
  n
end

class Numeric
  def prime?
    return false if self < 2
    (2..Math.sqrt(self).floor).to_a.none? { |n| divisible_by?(n) }
  end

  def divisible_by?(n)
    (self%n).zero?
  end
end

puts "Solution: #{solution(10001)}"
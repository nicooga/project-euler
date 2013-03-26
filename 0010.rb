# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

def solution(ceiling)
  n = 1
  primes = 0
  while n < ceiling
    n += 1
    next if n > 2 && n.even?
    primes += n if n.prime?
  end
  primes
end

class Numeric
  def prime?
    return false if self < 2
    not (2..Math.sqrt(self).floor).to_a.any? { |n| divisible_by?(n) }
  end

  def divisible_by?(n); (self%n).zero?; end
end

puts "Solution: #{solution(2e+6)}"
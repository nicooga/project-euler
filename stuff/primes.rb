require 'prime'

class Numeric
  def divisible_by?(n); (self%n).zero?; end

  def divisor_count
    prime_division.map do |n,p|
      (0..p).map { |i| n**i }
    end.inject do |a,f|
      a.product(f)
    end.size
  end

  def divisors
    prime_division.map do |n,p|
      (0..p).map { |i| n**i }
    end.inject do |a,f|
      a.product(f)
    end.map { |f| f.flatten.reduce(:*) }
  end
end
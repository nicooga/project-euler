require 'prime'

class Numeric
  def divisible_by?(n); (self%n).zero?; end

  def divisor_count
    @divisor_count ||= prime_division.map do |n,p|
      (0..p).map { |i| n**i }
    end.inject do |a,f|
      a.product(f)
    end.size
  end

  def divisors
    return @divisors ||= [self] if self == 1
    @divisors ||= prime_division.map do |n,p|
      (0..p).map { |i| n**i }
    end.inject([1]) do |a,f|
      a.product(f)
    end.map { |f| f.flatten.reduce(:*) } - [self]
  end

  def divisors_sum
    @div_sum ||= divisors.reduce(:+)
  end

  alias_method :div_sum, :divisors_sum
end
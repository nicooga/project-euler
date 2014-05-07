require 'prime'

class Numeric
  def divisible_by?(n); (self%n).zero?; end

  def divisor_count
    @divisors_count ||= prime_division.map do |n,p|
      (0..p).map { |i| n**i }
    end.inject do |a,f|
      a.product(f)
    end.size
  end

  def divisors
    return [self] if self == 1
    @divisors ||= prime_division.map do |n,p|
      (0..p).map { |i| n**i }
    end.inject([1]) do |a,f|
      a.product(f)
    end.map { |f| f.flatten.reduce(:*) } - [self]
  end

  def divisors_sum
    @divisors_sum ||= divisors.reduce(:+)
  end

  def digits(uniq: true)
    digits = to_s.split(//).map(&:to_i)
  end

  def shares_digit_with?(n)
    (digits & n.digits).any?
  end

  def shared_digit(n)
    i = digits & n.digits
    i.first if i.one?
  end

  def substract_digit(n)
    to_s.tr(n.to_s, '').to_i
  end

  def factorial
    return 1 if zero?
    (1..self).reduce(:*)
  end

  def digit_factoralization_sum
    self.digits(uniq: false).map(&:factorial).reduce(:+)
  end

  def rotations
    d = digits
    Array.new(to_s.size) { |i| d.rotate(i).join.to_i }
  end

  def palindrome?
    self.to_s == self.to_s.split(//).reverse.join
  end

  alias_method :div_sum, :divisors_sum
end

class String
  def palindrome?
    self.to_s == self.to_s.split(//).reverse.join
  end
end

# An irrational decimal fraction is created by concatenating the positive integers:
# 0.123456789101112131415161718192021...
# It can be seen that the 12th digit of the fractional part is 1.
# If dn represents the nth digit of the fractional part, find the value of the following expression.
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

def solution(nth_digits = (0..6).map { |x| 10 ** x })
  # Quantity of numbers with n digits
  qnd = ->(x) { 9 * (10 ** (x-1)) }
  # Mapping of what x's the numbers of n digits span over
  x_range = ->(x) do
    if x == 1
      1..9
    else
      (x_range[x-1].last + 1)..(x_range[x-1].last + (qnd[x] * x))
    end
  end

  nth_digits.map do |d|
    # The number of digits that has the number where d sits
    nd = (1..Float::INFINITY).find { |nd| x_range[nd] === d  }
    # Where begins the span of x's that cover the numbers with nd digits
    bs = x_range[nd].first

    dm = (d - bs).divmod(nd)
    (10**(nd-1) + dm.first).to_s[dm.last].to_i
  end.reduce(:*)
end

require 'awesome_print'
ap solution

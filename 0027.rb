# Euler published the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

# Using computers, the incredible formula  n² - 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

# Considering quadratics of the form:

# n² + an + b, where |a| < 1000 and |b| < 1000

# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

require 'awesome_print'
require 'prime'

def solution
  euler_size = ->(a,b) do
    count, x = 0, 1
    while ((x**2) + ((a)*x) + b).prime?
      x += 1
      count += 1
    end
    count
  end

  b_set = (-1000..1000).select(&:prime?)

  # (-1000..1000).map do |a|
  #   b_set.map do |b|
  #     [[a,b], euler_size[a,b]] 
  #   end.max_by(&:last)
  # end.max_by(&:last)

  ap euler_size[-61,97]
  ap euler_size[1,41]
end

solution
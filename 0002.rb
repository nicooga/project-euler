# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

require 'matrix'

FM = Matrix[[1,1],[1,0]]

def solution(ceiling)
  fib = ->(n){ return n if n.zero?; (FM**(n-1))[0,0] }
  ary = []
  i = 0
  while (n = fib[i]) < ceiling
    ary << n
    i += 1
  end
  ary.select(&:even?).reduce(:+)
end

puts "Solution: #{solution(4e+6)}"
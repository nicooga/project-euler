# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144

# The 12th term, F12, is the first term to contain three digits.
# What is the first term in the Fibonacci sequence to contain 1000 digits?

require 'matrix'

FM = Matrix[[1,1],[1,0]]

def solution(ceiling)
  fib = ->(n){ return n if n.zero?; (FM**(n-1))[0,0] }
  n, i = 0, 0

  loop do
    n += 1
    return n if fib[n].to_s.length >= ceiling
  end
end

puts "Solution: #{solution(1000)}"
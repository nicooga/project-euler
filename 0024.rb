# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

class Integer
  def ! # factorial
    (1..self).reduce(:*)
  end
end

def solution(set,i)
  ary = set.dup
  Array.new(ary.size) do
    bs = !(ary.size-1) || 1
    ind = (i.to_f/bs).ceil - 1
    i = i%bs
    ary.slice!(ind)
  end.join.to_i
end

require 'benchmark'

n = 0

Benchmark.bmbm do |x|
  x.report('Solving...') { n = solution((0..9).to_a, 1_000_000) }
end

puts "Solution: #{n}"
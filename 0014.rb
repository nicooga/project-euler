# The following iterative sequence is defined for the set of positive integers:
# n  n/2 (n is even)
# n  3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

def solution(ceiling)
  pool = { n: 0, chain_size: 0 }
  1.upto(ceiling) do |n|
    i = collatz_chain_size_for(n)
    pool = { n: n, chain_size: i } if i > pool[:chain_size]
    puts "Chain size for #{n} is #{i}"
  end
  pool
end

def collatz_chain_size_for(n)
  count = 1
  until n == 1
    n.even? ? n/=2 : n = n*3+1
    count += 1
  end
  count
end

puts "Solution: #{solution(1e+6)}"
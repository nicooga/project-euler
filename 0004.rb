# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome?(n); n.to_s.reverse == n.to_s; end

def solution(digits)
  i = 0
  (('9' * digits).to_i**2).downto(1) do |n|
    i = n ; break if palindrome?(n)
  end
  i
end

puts "Solution: #{solution(3)}"
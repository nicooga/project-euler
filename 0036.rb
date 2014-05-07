# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require_relative 'stuff/numbers'

def solution
  (1..1_000_000).select do |n|
    print "\r#{n}"
    n.palindrome? && n.to_s(2).palindrome?
  end.reduce :+
end

puts " Solution: #{solution}"

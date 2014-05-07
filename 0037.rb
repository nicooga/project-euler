require_relative 'stuff/numbers'
require_relative 'stuff/prime_numbers'

def solution
  Prime.lazy.select(&:two_sided?).first(15).pop(11).reduce :+
end

puts "Solution: #{solution}"

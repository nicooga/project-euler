# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can £2 be made using any number of coins?

def solution
  currency = [1, 2, 5, 10, 20, 50, 100, 200]

  # currency.map do |c|
  #   money = currency.take_while { |i| i <= c }

  #   (1..money.size).map do |size|
  #     money.permutation(size).to_a
  #   end
  # end

  (1..2).map do |size|
    [1,2].permutation(size).to_a
  end

  p caller
end

class Integer
  SUM_COMBINATION = {
    1 => [[1]],
    2 => [[1,1],[2]],
    3 => [[1,1,1],[1,2],[3]]
  }

  def sum_combination
    SUM_COMBINATION[self] || (
      (self-1).downto((self/2.0).ceil).map do |n|
        n.sum_combination.map { |c| (c+[self-n]).sort }
      end.flatten(1).uniq + [[self]]
    )
  end
end

require 'awesome_print'

if (1..10).all? do |n|
    n.sum_combination.all? { |c| c.reduce(:+) == n } &&
    n.sum_combination.include?([n])
  end
  puts "Tests successful!..."
else
  raise Exception.new(:test_suite_failed).exception("NOPE, my super smooth test suite failed.")
end

# 200.sum_combination.size

$count = 1

def a
  $count += 1
  b
end

def b
  $count += 1
  a
end

begin
  a 
rescue SystemStackError
  puts $count
end
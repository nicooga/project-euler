# Take the number 192 and multiply it by each of 1, 2, and 3:
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

class Array
  def concatenated_product
    join.to_i
  end
end

class Integer
  def concatenated_product(n_iterations = possible_solution?)
    (1..n_iterations).map do |n|
      self * n
    end.concatenated_product
  end

  def pandigital?
    ([1, 2, 3, 4, 5, 6, 7, 8, 9] - to_s.split(//).map(&:to_i)).empty?
  end

  BASE10 = (1..Float::INFINITY).lazy.map { |n| Math::log10(n) }

  def possible_solution?
    self_log = Math.log10(self)
    digits = 0
    solution = nil
    BASE10.map do |log|
      (self_log + log).floor + 1
    end.each_with_index do |ndx,i|
      if digits == 9
        solution = i
        break
      elsif digits > 9
        break
      end
      digits += ndx
    end
    solution
  end
end

def solution
  (1..9999).select do |i|
    if it = i.possible_solution?
      i.concatenated_product(it).pandigital?
    else
      nil
    end
  end.max.concatenated_product
end

puts "Solution: #{solution}"

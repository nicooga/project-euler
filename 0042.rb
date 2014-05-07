# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

def solution
  words = File.read File.expand_path('../stuff/words.txt', __FILE__)
  words.gsub(/"(\w+)"/).count { |s| $1.triangle? }
end

class String
  CHARS = ('A'..'Z').to_a

  def base26
    self.chars.inject(0) do |a,c|
      begin
        a += CHARS.index(c) + 1
      rescue Exception => e
      end
    end
  end

  def triangle?
    base26.triangle?
  end
end

class Integer
  TRIANGLES = (1..Float::INFINITY).lazy.map { |x| (x**2+x)/2 }

  def triangle?
    !!TRIANGLES.take_while { |x| x <= self }.find { |x| x == self }
  end
end

puts "Solution: #{solution}"

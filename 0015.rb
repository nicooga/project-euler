# Starting in the top left corner of a 2x2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20x20 grid?

def solution(x)
  (0...x).inject(1) do |p,i|
    p * ((2*x)-i) / (i+1)
  end
end

puts "Solution: #{solution(20)}"
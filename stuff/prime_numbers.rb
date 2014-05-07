require 'prime'

class Integer
  def two_sided?
    d = digits
    ((1...self.to_s.size).map { |i| d.dup.shift(i).join.to_i } +
    (1...self.to_s.size).map { |i| d.dup.pop(i).join.to_i } + [self]).all?(&:prime?)
  end
end

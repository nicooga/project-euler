require_relative 'numbers'

class Numeric
  def perfect?
    div_sum == self
  end

  def abundant?
    div_sum >  self
  end
end
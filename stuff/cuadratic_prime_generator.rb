require 'prime'

class CuadraticPrimeGenerator < Enumerator
  def initialize(a=1,b=49)
    @a, @b = a, b
    super() do |y|
      x = 0
      loop do
        y << x**2 + a*x + b
        x += 1
      end
    end
  end

  def euler_size
    take_while(&:prime?).size
  end

  def coefficients
    [@a, @b]
  end
end
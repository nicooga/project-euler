class Integer
  NUMERALS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety',
    100 => 'one hundred',
    1000 => 'one thousand'
  }

  def to_words
    return NUMERALS[self] if NUMERALS[self]
    return NUMERALS[self/100] + ' hundred' if (self%100).zero?

    h = self / 100
    t = self % 100 / 10
    u = self % 100 % 10

    str = h.zero? ? '' : h.to_words + ' hundred'
    str << ' and ' if !h.zero? && (!t.zero? || !u.zero?)
    str << if t < 2
      ((t*10)+u).to_words
    elsif u.zero?
      (t*10).to_words
    else
      "#{(t*10).to_words}-#{(u).to_words}"
    end
    str
  end
end

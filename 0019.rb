# You are given the following information, but you may prefer to do some research for yourself.
# · 1 Jan 1900 was a Monday.
# · Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one, 
#   Saving February alone, 
#   Which has twenty-eight, rain or shine. 
#   And on leap years, twenty-nine.
# · A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require 'date'

def solution(start_year,end_year)
  # TODO: Gotta solve the use of brute force here, not in the mood for it now.
  date_range = Date.new(start_year)..Date.new(end_year + 1)-1
  date_range.select { |d| d.day == 1 && d.sunday? }.size
end

puts "Solution: #{solution(1901,2000)}"
# Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
# What is the total of all the name scores in the fi?le?

def solution(path_to_file)
  list = File.read(path_to_file).split(',').map { |n| n.gsub(/\"/, '') }.sort
  alphabet = ('A'..'Z').to_a
  list.map.with_index do |name, i|
    name.split(//).map do |chr|
      alphabet.index(chr)+1
    end.reduce(:+)*(i+1)
  end.reduce(:+)
end

puts "Solution: #{solution('stuff/names.txt')}"
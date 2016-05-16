def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end

printer("Jumble Sort")

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

class String
  def jumble_sort(alphabet)
  end
end


puts "hello".jumble_sort == "ehllo"
puts "hello".jumble_sort(['o', 'l', 'h', 'e']) == 'ollhe'
puts "World".jumble_sort == "dlorW"



printer("My Inject")

#write your own my_inject method, that can take in an accumulator and defaults to the
#first item in the array if no accumulator is given

class Array
  def my_inject(accumulator = nil)
  end
end

puts [1, 2, 3].my_inject(1) { |acc, x| acc + x }) == 7
puts [3, 3].my_inject(3) { |acc, x| acc * x }) == 27
puts [1, 2, 3].my_inject { |acc, x| acc + x }) == 6
puts [3, 3].my_inject { |acc, x| acc * x }) == 9


printer("Range Summary")

# Range Summary
# ------------------------------------------------------------------------------
# Given a sorted array of integers without duplicates, return the start and end
# integers of number ranges found in the array. A number range is considered valid
# when all numbers from start to end are contiguous and only increment by 1.
# Assume all numbers are included as part of a range (no stand alone elements).

class Array
  def range_summary
  end
end

puts "-------Range Summary-------"
puts [0, 1].range_summary == [[0, 1]]
puts [0, 1, 4, 5].range_summary == [[0, 1], [4, 5]]
puts [0, 1, 3, 4, 6, 7].range_summary == [[0, 1], [3, 4], [6, 7]]
puts [0, 1, 2, 3, 4, 5, 7, 8, 9, 15, 16].range_summary == [[0, 5], [7, 9], [15, 16]]


printer("Hipsterfy")

# Hipsterfy
# ------------------------------------------------------------------------------
# Input is a string containing several words.
# Return a string with the last vowel removed from each word. 'y' is not a vowel.
# If a word has no vowels, don't change it.
#
# hipsterfy("towel flicker banana") => "towl flickr banan"
# ------------------------------------------------------------------------------
class String
  def hipsterfy
  end
end
# ------------------------------------------------------------------------------
puts "-------Hipsterfy-------"
puts "proper".hipsterfy == "propr"
puts "squeaker".hipsterfy == "squeakr"
puts "mstrkrft".hipsterfy == "mstrkrft"
puts "proper tonic panther".hipsterfy == "propr tonc panthr"
puts "towel flicker banana".hipsterfy == "towl flickr banan"
puts "runner anaconda".hipsterfy == "runnr anacond"
puts "turtle cheeseburger fries".hipsterfy == "turtl cheeseburgr fris"



printer("Merge Sort")

#Implement a merge sort that works both with and without block

class Array
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end

reversed = [1, 2, 3, 4, 5].shuffle.merge_sort do |num1, num2|
  # reverse order
  num2 <=> num1
end

puts (0..20).to_a.shuffle.merge_sort { reversed } == (0..20).to_a.reverse
puts (0..20).to_a.shuffle.merge_sort == (0..20).to_a
puts (0..10).to_a.shuffle.merge_sort == (0..10).to_a



printer("Recursive Factorial")

#Return a list of the factorials up to the given number

def factorials_rec(num)
end

puts factorials_rec(0) == 1
puts factorials_rec(1) == 1
puts factorials_rec(5) == 120
puts factorials_rec(6) == 720


printer("Subsets")

#Return all the subsets of the given array recursively

def subsets(arr)
end

puts subsets([]) == [[]]
puts subsets([1]) == [[], [1]]
puts subsets([1, 2]) == [[], [1], [2], [1, 2]]
puts subsets([1, 2, 3]) == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

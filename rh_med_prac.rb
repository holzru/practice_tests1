def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end



printer("Dup Finder")

#Return a hash with all duplicate items in the form: { item => [indicies]}

class Array
  def dups
  end
end

puts [1, 2, 3, 2, 4, 2].dups == { 2 => [1, 3, 5] }
puts [7, 3, 4, 5, 2, 7, 2, 5].dups => { 7 => [0, 5], 5 => [3, 7], 2 => [4, 7] }
puts (0..10).to_a.dups == nil


printer("Caesar Guesser")

# Caesar Guesser
# ------------------------------------------------------------------------------
# Caesar's cipher takes a word and encrypts it by offsetting each letter in
# the word by a fixed number, the key. For a key of 3, for example:
# a -> d, p -> s, and y -> b.
#
# Given that the most common letter in english is 'E', build a decrypter that
# takes an encrypted word, determines the key, and returns the decrypted word.
#
# Strategy: find the most common letter in the encrypted string and assume that it
# should be the letter "e" in the decrypted string. Use this information to
# calculate the key.  Use helper functions to declutter your code.

# We're giving you the alphabet as an array if you need it.
# ------------------------------------------------------------------------------

def caesar_guesser(encrypted_string, alphabet)
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
puts "----Caesar Guesser-----"
puts caesar_guesser("a", alphabet) == "e"
puts caesar_guesser("b", alphabet) == "e"
puts caesar_guesser("ruuauufuh", alphabet) == "beekeeper"
puts caesar_guesser("mnonwmcqntnny", alphabet) == "defendthekeep"
puts caesar_guesser("happdaiawpywga", alphabet) == "letthemeatcake"

printer("Number Counting Sequence")

# Number Counting Sequence
# ------------------------------------------------------------------------------
# The number counting sequence is a sequence of number strings that begins with:
# ["1", "11", "21", "1211", "111221", ...]
#
# "1" is counted as "one 1" or "11", followed by
# "11" which is counted as "two 1s" or "21", followed by
# "21" which is counted as "one 2 and one 1" or "1211", and so on.
#
# Given an integer n, generate the n-th element in the number counting sequence.

#Do yourself a favor if you don't understand the instructions read them out loud
def number_counting_seq(n)
  return "" if n == 0
  a = "11"
  return a[0...n] if n <= 2

  res = "11"
  (n-2).times do
    new_piece = res.split("").chunk_while { |a, b| a == b }.to_a if res.length > 1
    res = ""
    new_piece.each { |chunk| res += "#{chunk.length}#{chunk[0]}" }
  end
  res
end



puts "-------Number Counting Sequence-------"
puts number_counting_seq(0) == ""
puts number_counting_seq(1) == "1"
puts number_counting_seq(2) == "11"
puts number_counting_seq(3) == "21"
puts number_counting_seq(5) == "111221"
puts number_counting_seq(8) == "1113213211"
puts number_counting_seq(10) == "13211311123113112211"


printer("Substrings")

#return continuous substrings of length > 1 that are symmetric from the larger string

class String
  def symmetric_substrings
  end
end

#test Cases

printer("Binary Search")

#Construct a recursive binary search to return the index of the target number

class Array
  def bsearch(target)
  end
end

puts [1, 2, 3].bsearch(1) == 0
puts [2, 3, 4, 5].bsearch(3) == 1
puts [2, 4, 6, 8, 10].bsearch(6) == 2
puts [1, 3, 4, 5, 9].bsearch(5) == 3
puts [1, 2, 3, 4, 5, 6].bsearch(6) == 5
puts [1, 2, 3, 4, 5, 6].bsearch(0) == nil
puts [1, 2, 3, 4, 5, 7].bsearch(6) == nil


printer("Deep Dup")

#Make a deep dup of the array, items will be appended to your output to test if your dup is truly deep

class Array
  def deep_dup
  end
end

a = [1, [2], [3, [4]]]
b = a.deep_dup
b << 22
puts (a == [1, [2], [3, [4]]] && b == [1, [2], [3, [4]], 22])
b[1] << 99
puts (a == [1, [2], [3, [4]]] && b == [1, [2, 99], [3, [4]], 22])

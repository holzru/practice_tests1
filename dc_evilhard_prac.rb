def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end


# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.
#
# Difficulty: 2/5

def nearest_larger(array, index)
  check = array[index]

  left_idx = index - 1
  right_idx = index + 1
  until left_idx < 0 && right_idx > array.length
    left_item = array[left_idx]
    right_item = array[right_idx]
    unless left_idx < 0
      return left_idx if (left_item > check)
    end
    unless right_idx >= array.length
      return right_idx if (right_item > check)
    end
    left_idx -= 1
    right_idx += 1
  end
  nil
end

printer('nearest larger')
    p nearest_larger([2,3,4,8], 2) == 3
    p nearest_larger([2,8,4,3], 2) == 1
    p nearest_larger([2,6,4,8], 2) == 1
    p nearest_larger([2,6,4,6], 2)== 1
    p nearest_larger([8,2,4,3], 2) == 0
    p nearest_larger([2,4,3,8], 1) == 3
    p nearest_larger([2, 6, 4, 8], 3) == nil
    p nearest_larger([2, 6, 9, 4, 8], 3) == 2

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
  return 'e' if encrypted_string.length == 1
  key = encrypted_string.chars.max_by { |x| encrypted_string.count(x) }
  shift = alphabet.index(key) - alphabet.index('e')
  res = ""
  encrypted_string.chars.each do |letter|
    letter_idx = alphabet.index(letter)
    new_idx = (letter_idx - shift) % 26
    res << alphabet[new_idx]
  end
  res
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
puts "----Caesar Guesser-----"
puts caesar_guesser("a", alphabet) == "e"
puts caesar_guesser("b", alphabet) == "e"
puts caesar_guesser("ruuauufuh", alphabet) == "beekeeper"
puts caesar_guesser("mnonwmcqntnny", alphabet) == "defendthekeep"
puts caesar_guesser("happdaiawpywga", alphabet) == "letthemeatcake"


#### Aliquot Sequence ####
# A number's aliquot sum is the sum of all of its factors excluding itself.
#
# For example, the aliquot sum of 10 is: 1 + 2 + 5 = 8
#
# We can use the aliquot sum to define a special sequence, called the
# aliquot sequence. The aliquot sequence of a number begins with the
# number itself. The number's aliquot sum is the second element, that
# number's aliquot sum is the third element, that number's aliquot sum
# is the fourth element, and so on.
#
# For example, the first 4 numbers in the aliquot sequence of 10 are: 10, 8, 7, 1
#
# Write a function that takes in two numbers, base and n, and returns the
# aliquot sequence of length n starting with base.
#
# Examples:

def aliquot_sequence(x, y)
  res = [x]
  until res.length == y
    factors = factor_finder(res.last)
    res << (factors.reduce(0, :+))
  end
  res
end

def factor_finder(num)
  factor = 1
  factors = []
  while factor < num
    factors << factor if num % factor == 0
    factor += 1
  end
  factors
end

printer('alinquot bullshit')
p aliquot_sequence(10, 4) == [10, 8, 7, 1]
p aliquot_sequence(10, 2) == [10, 8]
p aliquot_sequence(7, 4) == [7, 1, 0, 0]


# Serial Killer Summary
# ------------------------------------------------------------------------------
# You have a calendar of murders that mafia members committed (given as a list of
# names by murderer).  Some of them are serial killers: some have murdered multiple
# times in a row.
#
# Return a hash where the keys are the serial killers and the values are an array
# of all of the start and end days of their killing sprees.
#
# Days are the index of the calendar array.

def serial_killer_summary(calendar_of_murderers)
  killers = {}
  spree = []
  calendar_of_murderers.each_with_index do |killer, index|
    next_index = index + 1
    next_killer = calendar_of_murderers[next_index]
    if killer == next_killer && spree.empty?
      spree << index
    elsif killer != next_killer
      spree << index
      if killers.include?(killer)
        killers[killer] << spree unless spree.length < 2
      else
        killers[killer] = [spree] unless spree.length < 2
      end
      spree = []
    end
  end
  killers
end

puts "-------Serial Killer Summary-------"

crime_calendar_1 = [
    "Bald Vinnie",
    "Fat Tony",
    "Bald Vinnie",
    "Bald Vinnie",
    "Fat Tony"
]

serial_killer_counts_1 = {
    "Bald Vinnie" => [[2, 3]]
}

crime_calendar_2 = [
    "Bald Vinnie",
    "Bald Vinnie",
    "Saucy Michael",
    "Fat Tony",
    "Fat Tony",
    "Bald Vinnie",
    "Bald Vinnie",
    "Bald Vinnie",
    "Fat Tony",
    "Slim Lorenzo"
]

serial_killer_counts_2 = {
    "Bald Vinnie" => [[0, 1], [5, 7]],
    "Fat Tony" => [[3, 4]]
}

p serial_killer_summary(crime_calendar_1) == serial_killer_counts_1
p serial_killer_summary(crime_calendar_2) == serial_killer_counts_2


#Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return "" if string == ""
  string[-1] + string[0..-2].reverse
end

printer('reverse')
p reverse('abc') == 'cba'
p reverse('lolimatroll') == 'lolimatroll'.reverse

# You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

printer('add to 12')

def add_to_twelve?(array)
  return false if array.length <= 1
  return true if array[0..1].reduce(:+) == 12

  add_to_twelve?(array[1..-1])
end


p add_to_twelve?([1, 1, 2, 3, 4, 5, 7, 4, 5, 6, 7, 6, 5, 6]) == true
p add_to_twelve?([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6]) == false

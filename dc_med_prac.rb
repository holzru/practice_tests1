def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end


# Hash: Difference
#
# Write a method, `Hash#difference(other_hash)`. Your method should return
# a new hash containing only the keys that appear in one or the other of
# the hashes (but not both!) Thus:
#
# ```ruby
# hash_one = { a: "alpha", b: "beta" }
# hash_two = { b: "bravo", c: "charlie" }
# hash_one.difference(hash_two)
#  # => { a: "alpha", c: "charlie" }
# ```

class Hash
  def difference(other_hash)

  end
end

printer('hash diff')
hash_one = { a: "alpha", b: "beta" }
hash_two = { b: "bravo", c: "charlie" }
p hash_one.difference(hash_two) == { a: "alpha", c: "charlie" }

###______________OPTIONAL QUESTION________________###
#This question is optional because it was on the homework, and there are no tests. I want you to test and poke your own code!
#Write an implementation of a stack. You must have 5 methods - initialize, add, remove, show, and peek.
#NB THERE ARE NO TESTS FOR THIS. You should be able to call the methods on an array and see your stack work.
# It should be simple, each method should contain a one-liner. The method functions
#are here: Init should create an ivar to store the stack, add must add an el, remove must remove an el, show must
#return a copy of the stack that cannot be modified, and peek must show you the top stack el.

class Stack

end

# Biodiversity
# ------------------------------------------------------------------------------
# Given an array of specimens, return the biodiversity index, which is defined
# by the following formula:
#
# biodiversity = number_of_species**2 * smallest_population_size / largest_population_size
#
# ------------------------------------------------------------------------------

def biodiversity_index(specimens)
  #
  # your code goes here
  #
end

puts "------Biodiversity------"
puts biodiversity_index(["cat"]) == 1
puts biodiversity_index(["cat", "cat", "cat"]) == 1
puts biodiversity_index(["cat", "cat", "dog"]) == 2
puts biodiversity_index(["cat", "fly", "dog"]) == 9
puts biodiversity_index(["cat", "fly", "dog", "dog", "cat", "cat"]) == 3


# Catsylvanian money is a strange thing: they have a coin for every
# denomination (including zero!). A wonky change machine in
# Catsylvania takes any coin of value N and returns 3 new coins,
# valued at N/2, N/3 and N/4 (rounding down).
#
# Write a method `wonky_coins(n)` that returns the number of coins you
# are left with if you take all non-zero coins and keep feeding them
# back into the machine until you are left with only zero-value coins.
#
def wonky_coins(n)

end

printer('wonky coins')
p wonky_coins(6) == 15
p wonky_coins(5) == 11
p wonky_coins(1) == 3
p wonky_coins(0) == 1


# Build a function, `morse_encode(str)` that takes in a string (no
# numbers or punctuation) and outputs the morse code for it. I have provided a morse dictionary.
#
# I wrote a helper method `morse_encode_word(word)` that handled a
# single word.
#
# Difficulty: 2/5
def morse_encode
  morse_dict = {
                              "a" => ".-",
                              "b" => "-...",
                              "c" => "-.-.",
                              "d" => "-..",
                              "e" => ".",
                              "f" => "..-.",
                              "g" => "--.",
                              "h" => "....",
                              "i" => "..",
                              "j" => ".---",
                              "k" => "-.-",
                              "l" => ".-..",
                              "m" => "--",
                              "n" => "-.",
                              "o" => "---",
                              "p" => ".--.",
                              "q" => "--.-",
                              "r" => ".-.",
                              "s" => "...",
                              "t" => "-",
                              "u" => "..-",
                              "v" => "...-",
                              "w" => ".--",
                              "x" => "-..-",
                              "y" => "-.--",
                              "z" => "--..",
                              " " => " ", }

  end

printer('morse encode')
p morse_encode("q") == "--.-"
p morse_encode("cat") == "-.-. .- -"
p morse_encode("cat in hat") == "-.-. .- -  .. -.  .... .- -"

# Vigenere Cipher
# ------------------------------------------------------------------------------
# Caesar's cipher takes a word and encrypts it by offsetting each letter in
# the word by a fixed number, the key. For a key of 3, for example:
# a -> d, p -> s, and y -> b
#
# Vigenere's Cipher is a Caesar cipher, but instead of a single key, a sequence
# of keys is used. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Write a method that takes a string and a key-sequence, returning
# the encrypted word.

# We're giving you the alphabet as an array if you need it.
# ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence, alphabet)
  #
  # your code goes here
  #
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1], alphabet) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2], alphabet) == "uqftsktjvobp"
puts vigenere_cipher("toerrishuman", [1, 2, 3], alphabet) == "uqhstltjxncq"

#### Winning Streak ####
# You are a professional chess player. Your competitive record is stored as a
# string of 'W's and 'L's, signifying matches you've won and lost. Write a
# function that determines your longest winning streak from a given record.
# YOU ARE NOT ALLOWED TO USE CHUNK_WHILE. YES, THAT MEANS YOU RUSS.
# Example:
def winning_streak(str)

end

printer 'winning streak'
p winning_streak("WLLWWWLW") == 3

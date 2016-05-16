def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end



# Find the sum of every element in a nested array
# May not use Array#flatten but you may use your own helper method to flatten.
# Ex. [ 1, 2, 3, 5, [4, 5], [6, 10] ] == 36

printer("Nested Sum")

def nested_sum(array)

end

def my_flatten(array)

end

p nested_sum([ 1, [2, 3], [10] ]) == 16
p nested_sum([ 1, 2, 3, 5, [4, 5], [6, 10] ]) == 36
p nested_sum([ 5, 5, [5, 5, 5], 5 ]) == 30



printer("Delete nth duplicate")

# Given a list lst and a number N, create a new list that contains each number of lst at most N times without reordering. For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].
#
# Ex.
#   delete_nth ([1,1,1,1],2) # return [1,1]
#   delete_nth ([20,37,20,21],1) # return [20,37,21]

def delete_nth_duplicate(array, n)

end

p delete_nth_duplicate([1,1,1,1], 2) == [1,1]
p delete_nth_duplicate([20,37,20,21], 1) == [20,37,21]



printer("Unused Digits")

# Given few numbers, you need to print out the digits that are not being used.
#
# Example:
#
# unused_digits(12, 34, 56, 78) # "09"
# unused_digits(2015, 8, 26) # "3479"
# Note:
#
# Result string should be sorted
# The test case won't pass Integer with leading zero

def unused_digits(*numbers)

end

p unused_digits(12, 34, 56, 78) == "09"
p unused_digits(2015, 8, 26) == "3479"



printer("Abbreviated String")

# The word i18n is a common abbreviation of internationalization the developer community use instead of typing the whole word and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.
#
# Write a function that takes a string and turns any and all words within that string of length 4 or greater into an abbreviation following the same rules.
#
# Notes:
#
# A "word" is a sequence of alphabetical characters. By this definition, any other character like a space or hyphen (eg. "elephant-ride") will split up a series of letters into two words (eg. "elephant" and "ride").
# The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (eg. "e6t-r2e").

def abbreviate(string)

end

p abbreviate("banana") == "b4a"
p abbreviate("double-barrel") == "d4e-b4l"
p abbreviate("You, and I, should speak.") == "You, and I, s4d s3k."



printer("Narcissistic Number")

# A Narcissistic Number is a number which is the sum of its own digits, each raised to the power of the number of digits.
# Ex. take 153 (3 digits):
#     1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
# and 1634 (4 digits):
#     1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634
# Your code must return true or false depending upon whether the given number is a Narcissistic number.

def narcissistic?(number)

end

p narcissistic?(153) == true
p narcissistic?(1634) == true
p narcissistic?(15) == false

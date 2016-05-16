# A number's aliquot sum is the sum of all of its factors excluding itself.
#
# For example, the aliquot sum of 10 is: 1 + 2 + 5 = 8
#
# We can use the aliquot sum to define a special sequence, called the
# aliquot sequence. The aliquot sequence of a number begins with the
# number itself. The second number in the sequence is the first number's
# aliquot sum, the third number is the second number's aliquot sum, and
# so on.
#
# For example, the first 4 numbers in the aliquot sequence of 10 are: 10, 8, 7, 1
#
# Write a function that takes in two numbers, base and n, and returns the
# aliquot sequence of length n starting with base.
#

def aliquot_sequence(base, count)
end

puts "aliquot_sequence(10, 4) => [10, 8, 7, 1]: #{aliquot_sequence(10, 4) == [10, 8, 7, 1]}"
puts "aliquot_sequence(10, 2) => [10, 8]: #{aliquot_sequence(10, 2) == [10, 8]}"
puts "aliquot_sequence(7, 4) => [7, 1, 0, 0]: #{aliquot_sequence(7, 4) == [7, 1, 0, 0]}"

def bubble_sort(array, &prc)
end

# Write a method that transposes a grid

class Array
  def my_transpose
  end
end

arr1 = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
puts "arr1.my_transpose == [[0, 3, 6], [1, 4, 7], [2, 5, 8]]: #{arr1.my_transpose == [[0, 3, 6], [1, 4, 7], [2, 5, 8]]}"

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
end

# You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
end


### My Zip
# Write `my_zip` to take any number of arguments.  It should return a
 # new array containing `self.length` elements.  Each element of
 # the new array should be an array with a length of the input
 # arguments + 1 and contain the merged elements at that index.
 # If the size of any argument is less than `self`, `nil` is
 #  returned for that location.

class Array
  def my_zip()
  end
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
c = [10, 11, 12]
d = [13, 14, 15]
puts "[1, 2, 3].my_zip(a, b) => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]:
#{[1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]}"
puts "a.my_zip([1,2], [8]) => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]:
 #{a.my_zip([1,2], [8]) == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]}"
puts "[1, 2].my_zip(a, b) => [[1, 4, 7], [2, 5, 8]]:
 #{[1, 2].my_zip(a, b) == [[1, 4, 7], [2, 5, 8]]}"
puts "[1, 2].my_zip(a, b, c, d) => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]:
#{[1, 2].my_zip(a, b, c, d) == [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]}"

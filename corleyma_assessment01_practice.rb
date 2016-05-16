require 'colorize'

#################################################
###     Write Your Own Enumerable Methods     ###
###       TODO: practice til you do them      ###
###             *all* in <= 4 minutes)        ###
#################################################
#################################################

###  NB: Where applicable, each method should
###      take an optional block.

class Array
  def my_each_with_index
  end

  def my_take_while
  end

  def my_chunk
  end

  def my_reduce
  end

  def my_rotate(shift)
  end
end

# ------------------------------------------------------------------------------
# Pascal's Triangle
# ------------------------------------------------------------------------------
# Many of the recursive problems given by a/A involve building a sequence
# recursively.  For this problem you will write two functions.  One, your
# "inductive" function, next_pascal_row, will take in a row of Pascal's
# triangle as an array, returning the next row in the sequence.
#
# Function two, pascal_seq(n), will recursively build an array of the first n
# rows of Pascal's triangle, returning the rows in triangular order.
#
# NB: This problem is a lot like factorial_rec on the practice assessment.
# ------------------------------------------------------------------------------

def next_pascal_row(row)

end

def pascal_seq(n)

end

# ------------------------------------------------------------------------------
# Longest Digit Run
# ------------------------------------------------------------------------------
# Return the digit with the greatest number of consecutive repeats
# NB: For practice, try doing it with and without FixNum.to_s
# In the event of a tie, return the largest digit.
# ------------------------------------------------------------------------------

def longest_digit_run(digit)
end

# ------------------------------------------------------------------------------
# Range Summary  --- NB: Don't use chunk_while; implement your own
# ------------------------------------------------------------------------------
# Given a sorted array of integers without duplicates, return the start and end
# integers of number ranges found in the array. A number range is considered valid
# when all numbers from start to end are contiguous and only increment by 1.
# Assume all numbers are included as part of a range (no stand alone elements).
# -----------------------------------------------------------------------------

def range_summary(array)

end

##############
##############

def printer(problem_name)
  len = (78 - problem_name.length)/2
  string1 = "#{"="*len} #{problem_name} #{"="*len}"
  string2 = "#{"=" * string1.length }"
  puts "\n"
  puts string1.colorize(:yellow)
  puts string2.colorize(:yellow)
end

def bool_printer(bool)
  bool ? puts("true".colorize(:green)): puts("false".colorize(:red))
end

##############
##############
printer("my_each_with_index")
print  "Takes a block and executes on each element #=> "
new_arr = []; [0,1,2,3,4].my_each_with_index { |el, i| new_arr << (el+i) }
bool_printer(new_arr == [0,2,4,6,8])

print  "\nReturns itself #=> "
bool_printer([0,1,2].my_each_with_index { |el, i| new_arr << (el+i)} == [0,1,2])

##############
##############
printer("my_take_while")
print "passes each element to a block, returning all elements\n" +
      "before the first element for which the block evaluates false #=> "
bool_printer([0,1,2,3,4].my_take_while { |el| el <= 2 } == [0,1,2])

##############
##############
printer("my_chunk")
print "Takes a block and returns an array of arrays of consecutive elements\n" +
      "for which block returns true #=> "
bool_printer([1,3,3,2,4,5,7].my_chunk { |n| n.odd?} == [[1,3,3],[2],[4],[5,7]])


##############
##############
printer("my_rotate")
print "Rotates an array by a positive shift #=> "
bool_printer(["a","b", "c", "d"].my_rotate(1) == ["b", "c", "d", "a"])

print "Rotates an array by a negative shift #=> "
bool_printer(["a","b", "c", "d"].my_rotate(-3) == ["b", "c", "d", "a"])

##############
##############
printer("Pascal's Triangle")

print "next_pascal_row takes a row and returns the next #=> "
bool_printer(next_pascal_row([1,5,10,10,5,1]) == [1,6,15,20,15,6,1])

print "pascal_seq(n) returns an array of rows 1 to n of pascal's triangle"
bool_printer(pascal_seq(4) == [[1,1],
                               [1,2,1],
                               [1,3,3,1],
                               [1,4,6,4,1]])

##############
##############
printer("longest_digit_run")
print "Returns digit w/ most consecutive repeats #=> "
bool_printer(longest_digit_run(11122233333) == 3)

print "Returns largest digit in event of tie #=> "
bool_printer(longest_digit_run(11122223333) == 3)

##############
##############
printer("range_summary")

print "Finds a single range #=> "
 bool_printer(range_summary([0, 1]) == [[0, 1]])

print "Finds two ranges #=> "
 bool_printer(range_summary([0, 1, 4, 5]) == [[0, 1], [4, 5]])

print "Finds multiple ranges #=> "
 bool_printer(range_summary([0, 1, 3, 4, 6, 7]) == [[0, 1], [3, 4], [6, 7]])

print "Collapses multi-element ranges into an array of [start, end] #=> "
bool_printer(range_summary([0, 1, 2, 3, 4, 5, 7, 8, 9, 15, 16]) ==
                           [[0, 5], [7, 9], [15, 16]])

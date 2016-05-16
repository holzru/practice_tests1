def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end

#hi studious indivudual! You are awesome (unless your name is Russel ;0)
#good luck! This is the easy practice exam.
#Use caution, tests may have bugs, do not treat them like the word of god.

#Write a my_each function, then use that function to write a my_select function. Yes, two functions, one problem!

class Array
  def my_each(&block)

  end

  def my_select(&block)


  end

end

printer('my each, my select')
p [1, 2, 3, 4].my_each({|x| x}) == [1, 2, 3, 4]
p [5, 6, 7, 8].my_select({|x| x < 6}) == [5]

# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.

def num_repeats(string)
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

printer('num repeats')
puts('num_repeats("abdbc") == 1: ' + (num_repeats('abdbc') == 1).to_s)
puts('num_repeats("aaa") == 1: ' + (num_repeats('aaa') == 1).to_s)
puts('num_repeats("abab") == 2: ' + (num_repeats('abab') == 2).to_s)
puts('num_repeats("cadac") == 2: ' + (num_repeats('cadac') == 2).to_s)
puts('num_repeats("abcde") == 0: ' + (num_repeats('abcde') == 0).to_s)

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)

end

printer('concat')
p concatenate(['a', 'b', 'c']) == 'abc'
p concatenate(["Yay ", "for ", "strings!"]) == "Yay for strings!"
p concatenate(['fuck', 'this', 'lack', 'of', 'sleep']) = 'fuckthislackofsleep'

# ### `eval_block`
#
# Write an `eval_block` method that takes some arguments and a block. It should
# call the block, passing all the arguments to the block at once (individually,
# not as an array) using the splat operator. If the user doesn't supply the
# block, it should raise an error and print out "NO BLOCK GIVEN!".
#
# Examples of calling `eval_block`:
#
# ```ruby
# # Example calls to eval_block
# eval_block("Kerry", "Washington", 23) do |fname, lname, score|
#   puts "#{lname}, #{fname} won #{score} votes."
# end
# # Washington, Kerry won 23 votes.
# # => nil
#
# eval_block(1,2,3,4,5) do |*args|
#   args.inject(:+)
# end
# # => 15
#
# eval_block(1, 2, 3)
# # => "NO BLOCK GIVEN"
# ```

def eval_block(*args, &prc)

end

printer("eval block")
p eval_block([5, 6], nil) #should raise an error
p eval_block(1,2,3,4,5) do |*args|
   args.inject(:+)
 end == 15 #should be 15


 # Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)

class Array
  def two_sum

  end
end

printer('two sum')
p [-1, 0, 2, -2, 1].two_sum == [[0, 4], [2, 3]]
p [5, 6, 7, -3, -5, 15].two_sum == [[0, 3], [2, 4]]


# My second program for day 1 of the 30 Days with Rails is "Lucky Sevens" which
# is one of the practice questions used by App Academy.

# Write a function lucky_sevens?(numbers), which takes in an array of integers
# and returns true if any three consecutive elements sum to 7.

def lucky_sevens?(numbers)

end

printer('lucky sevens')
puts lucky_sevens?([2,1,5,1,0]) == true # => 1 + 5 + 1 == 7
puts lucky_sevens?([0,-2,1,8]) == true # => -2 + 1 + 8 == 7
puts lucky_sevens?([7,7,7,7]) == false
puts lucky_sevens?([3,4,3,4]) == false
puts lucky_sevens?([1, 2, 3, 4, 0, 5, 5]) == true

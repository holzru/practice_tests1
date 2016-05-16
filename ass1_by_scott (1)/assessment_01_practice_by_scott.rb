
require_relative 'assessment_01_practice_by_scott_test.rb'

# *****************************
# START START START START START
# *****************************

# <3 <3  <3 <3  <3 <3  <3 <3  <3 <3  <3 <3  <3 <3
# KONICHIWA, sempai! ^_^
# I made you a very special practice assessment today, because I want you to do your very best!!! <3
# Good luck, sempai!
# <3 <3  <3 <3  <3 <3  <3 <3  <3 <3  <3 <3  <3 <3

# Write a method that flattens the array it was called upon recursively, sempai!
# [1,[1,[1]]] #=> [1,1,1]
class Array
  def flatten_rec

  end
end

jumbled_array = [1, ["lel"], 2, 3, 4, ["a", ["kappa"], ["kek"]], true, {}]
puts "> flatten_rec test: #{test_1(jumbled_array).passed?} #{test_1(jumbled_array).passed_phrase}"


# Write a method that returns the biggest prime number UNDER a certain limit, sempai!!
# 10 #=> 7
# 9 #=> 7
def biggest_prime(limit)

end

puts "> biggest_prime test: #{test_2(10).passed?} #{test_2(10).passed_phrase}"


# Write your own uniq method, sempai!!
# [1,2,2,3,4,5,5] #=> [1,2,3,4,5]
class Array
  def my_uniq

  end
end

not_unique = [1,2,2,3,4,5,5]
puts "> my_uniq test: #{test_3(not_unique).passed?} #{test_3(not_unique).passed_phrase}"

# Write your own quick sort method, sempai!!!
# [4,1,2,3,5] #=> [1,2,3,4,5]
class Array
  def quick_sort

  end
end

unsorted = (1..10).to_a.shuffle
puts "> quick_sort test: #{test_4(unsorted).passed?} #{test_4(unsorted).passed_phrase}"


# Write your own select method, sempai!!!
# [1,2,3,4,5].my_select{|el| el < 3} #=> [1,2]

class Array
  def my_select

  end
end

whole = (1..10).to_a
puts "> my_select test: #{test_5(whole).passed?} #{test_5(whole).passed_phrase}"


# Write a binary search method, sempai!!!
# [1,2,3,4,5,6,9,10].bi_search(9) #=> 6

class Array
  def binary_search(target)

  end
end

sorted_array, target = [1, 3, 4, 5, 7, 8, 11], 8
puts "> binary_search test: #{test_6(sorted_array, target).passed?} #{test_6(sorted_array, target).passed_phrase}"

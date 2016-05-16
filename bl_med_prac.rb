
# write the binary search algorithm
def binary_search(arr, target)

end

binary_search([1, 3, 4, 6, 9], 10) == nil
binary_search([1, 3, 4, 6, 9], 9) == 4
binary_search([1, 3, 4, 6, 9], 8) == nil
binary_search([1, 3, 4, 6, 9], 3) == 1

# write a select function that returns an array of items that meet
# the passed blocks conditions

def my_select(arr, &blk)

end

my_select([1, 2, 3, 4, 5]) { |x| x < 2} == [1]
my_select([1, 2, 3, 4, 5]) { |x| x > 1} == [2, 3, 4, 5]

# check if string a palindrome with out using String#reverse

def palindrome?(string)

end

palindrome?('aba') == true
palindrome?('aba zaba') == true
palindorme?("golf") == false

# return an array of the Fibonacci sequeence up to the nth element,
# using recursion
def fib_rec(n)

end

fib_rec(4) == [0, 1, 1, 2]
fib_rec(6) == [0, 1, 1, 2, 3, 5]
fib_rec(1) == [0]

# make a recrusive method to find the result of the given base to
# the power without using **
def exp_rec(base, power)

end

exp_rec(2, 4) == 16
exp_rec(3, 3) == 27
exp_rec(5, 0) == 1

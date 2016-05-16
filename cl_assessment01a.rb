# Reimplement the inject method on Array. If an accumulator parameter
# is not passed, initialize the accumulator with the first element of
# the receiver. For example, calling your method on [4, 6, 3] with no
# parameter and with block { |x, y| x + y } should return 13.
class Array
  def my_inject(accumulator = nil)
  end

  def my_inject(accumulator = nil, &blk)
  end
end

# Implement a Fixnum method that returns the an initial segment of
# the stream of primes, whose length equals the receiver. For example,
# calling your method on 4 should return [2, 3, 5, 7].
class Fixnum
  def primes
  end
end

# Recursively implement a Fixnum method that returns an initial segment
# of the stream of factorials, whose length equals the receiver. For
# example, calling your method on 4 should return [1, 1, 2, 6].
class Fixnum
  def factorials
  end
end

# Implement an Array method that returns a hash such that, if at least
# two of the receiver's indices correspond to the same value, then they
# are grouped in an array keyed to that value. For example, calling your
# method on [3, 3, 1, 2, 1] should return { 1 => [2, 4], 3 => [0, 1] }.
class Array
  def duplicate_indices
  end
end

# Implement a String method that returns an array of the receiver's
# nontrivially palindromic substrings. For example, calling your method
# on 'cdc1aba' should return ['aba', 'cdc'].
class String
  def palindromic_substrings
  end
end

# Implement an Array method that accepts a comparator block and merge-
# sorts the receiver under the ordering defined by the comparator.
class Array
  def merge_sort
  end

  def merge_sort(&blk)
  end
end

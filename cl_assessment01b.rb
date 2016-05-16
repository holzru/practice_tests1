# Reimplement the flatten method on Array. For example, calling your
# method on [[1, 2], [6, 5, [4, 3]] should return [1, 2, 6, 5, 4, 3].
class Array
  def my_flatten
    return self if self.all? { |x| x.is_a?(Fixnum) }
    arr = self.dup
    res = []
    arr.each_with_index do |term, index|
      if term.is_a?(Array)
        return res + term.my_flatten + arr[index+1..-1].my_flatten
      else
        res << term
      end
    end
    res
  end
end

p [[1, 2], [6, 5, [4, 3]]].my_flatten #== [1, 2, 6, 5, 4, 3]

# Recursively implement a Fixnum method that returns an initial segment
# of the stream of binary powers, whose length equals the receiver.
# For example, calling your method on 5 should return [1, 2, 4, 8, 16].
class Fixnum
  def binary_powers
    return [1] if self == 1

    (self-1).binary_powers + [(2)*(self-1).binary_powers.last]
  end
end

p 5.binary_powers == [1, 2, 4, 8, 16]

# Iteratively implement a Fixnum method that returns an initial segment
# of the stream of Fibonacci numbers, whose length equals the receiver.
# For example, calling your method on 5 should return [1, 1, 2, 3, 5].
class Fixnum
  def fibonacci_numbers
    a = [1, 1]
    return a[0..self] if self <= 2

    (self-1).fibonacci_numbers + [(self-1).fibonacci_numbers[-2..-1].reduce(:+)]
  end
end

p 5.fibonacci_numbers == [1, 1, 2, 3, 5]

# Implement an Array method which returns a hash such that, if at least
# two of the receiver's indices correspond to elements that yield the
# same result from the block, then they are grouped in an array keyed
# to that result. For example, calling your method on [1, 3, 4, 5, 6]
# should return the hash { 0 => {1, 4}, 1 => {0, 2} } when passed thef
# block { |num| num % 3 }.
class Array
  def group_indices_by(&blk)
    hash = Hash.new { [] }
    self.each_with_index do |term, index|
      hash[blk.call(term)] += [index]
    end
    p hash
    hash.select { |k, v| v.length == 2 }
  end
end

p [1, 3, 4, 5, 6].group_indices_by { |num| num % 3 }

# Recursively implement an Array method that returns an array of the
# receiver's subarrays. For example, calling your method on [1, 2]
# should return [[], [1], [2], [1, 2]].
class Array
  def subarrays
    arr = self.dup
    return [arr] if arr.length == 0

    last_el = arr.pop

    rest_subs = arr.subarrays

    rest_subs + rest_subs.map { |term| term.dup << last_el }
  end
end

p [1, 2].subarrays

# Implement an Array method that accepts a comparator block and quick-
# sorts the reciever under the ordering defined by the comparator.
class Array
  def quicksort
    arr = self.dup
    return arr if arr.length <= 1

    pivot = arr.shift

    left = arr.select { |term| term < pivot }
    right = arr.select { |term| term > pivot }

    left.quicksort + [pivot] + right.quicksort
  end

  def quicksort_blk(&blk)
    arr = self.dup
    return arr if arr.length <= 1

    pivot = arr.shift

    left = arr.select { |term| blk.call(term, pivot) == -1 }
    right = arr.select { |term| blk.call(term, pivot) >= 0 }

    left.quicksort_blk(&blk) + [pivot] + right.quicksort_blk(&blk)
  end
end

p (0..10).to_a.shuffle.quicksort == (0..10).to_a
p (0..10).to_a.shuffle.quicksort_blk { |a,b| a <=> b } == (0..10).to_a

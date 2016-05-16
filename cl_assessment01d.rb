# Reimplement the zip method on Array. Your method should take arbitarily
# many parameters. For example, calling your method on [1, 2, 3] with
# parameters [4, 5, 6] and [7, 8, 9] should return [ [1, 4, 7], [2, 5, 8],
# [3, 6, 9] ].
class Array
  def my_zip(*arrays)

    res = []
    self.each { |term| res << [term] }

    index = 0
    until index == self.length
      arrays.each { |array| res[index] << array[index] }
      index += 1
    end
    res
  end
end

p [1, 2, 3].my_zip([4, 5, 6], [7, 8, 9])

# Recursively implement a Fixnum method that returns an initial segment
# of the stream of triangular numbers, whose length equals the receiver
# For example, calling your method on 5 should return [1, 3, 6, 10, 15].
class Fixnum
  def triangular_numbers
    return [1] if self == 1

    rest = (self-1).triangular_numbers

    rest + [self + rest.last]
  end
end

p 5.triangular_numbers

# Implement a Fixnum method that makes minimal change for the number of
# currency units represented by the receiver, using only the specified
# denominations. For example, calling your method on 24 with parameter
# [1, 7, 10] should return [10, 7, 7].
class Fixnum
  def make_change(denominations)

    return [] if self == 0

    num = self

    denominations = denominations.select { |coins| coins <= self }.sort.reverse

    return nil if denominations.empty?

    best_change = nil

    denominations.each_with_index do |coin, index|

      remainder = self - coin

      next_change = remainder.make_change(denominations[0...-1])

      next if next_change.nil?

      best_change = next_change + [coin] if best_change.nil? || next_change.length > next_change.length

    end

    best_change
  end
end

p 24.make_change([1, 7, 10])

# Implement an Array method that checks whether the receiver's elements
# sum to the given target. For example, [1, 2, 4].sum_to?(7) should
# return a truthy value.
class Array
  def sum_to?(target)
    self.reduce(:+) == target
  end
end

# Implement a String method that accepts an array of strings and selects
# those which differ from the receiver by a single character while also
# being the same length as the receiver. For example, calling your method
# on "boo" with parameter ['cow', 'boot', 'bow'] should return ['bow'].
class String
  def adjacent_words(dictionary)
    res = dictionary.select { |word| word.length == self.length && word_check?(word) }
    res
  end

  def word_check?(word)
    count = 0
    word.chars.each_with_index do |letter, idx|
      count += 1 unless letter == self[idx]
    end
    count == 1
  end
end

p "boo".adjacent_words(['cow', 'boot', 'bow'])

# Implement an Array method that recursively duplicates each element of
# the receiver. For example, defining a = [1] and calling your method
# on [a] should return an array that is not affected by future mutations
# of a. You may assume that the receiver contains only arrays and
# immutable objects.
class Array
  def deep_dup

    arr = self.dup
    return arr if arr.none? { |term| term.is_a?(Array) }

    res = []
    arr.each do |term|
      if term.is_a?(Array)
        res += [term.deep_dup]
      else
        res << term
      end
    end
    res
  end
end

a = [1, [2], [3, [4]]]
b = a.deep_dup
b << 22
puts (a == [1, [2], [3, [4]]] && b == [1, [2], [3, [4]], 22])
b[1] << 99
puts (a == [1, [2], [3, [4]]] && b == [1, [2, 99], [3, [4]], 22])

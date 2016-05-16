# Reimplement the join method on Array. If a separator parameter is not
# passed, use the empty string as the default separator. For example,
# calling your method on [1, :a, 'whee'] with separator '$' should
# return '1$a$whee'.
class Array
  def my_join(separator = '')
    res = ""
    self.each do |item|
      item = item.to_s unless item.is_a?(String)
      if item == self.last
        res += item
      else
        res += item + separator
      end
    end
    res
  end
end

p [1, :a, 'whee'].my_join("$") == "1$a$whee"

# Recursively implement a Fixnum method that returns an initial segment
# of the stream of Fibonacci numbers, whose length equals the receiver.
# For example, calling your method on 4 should return [1, 1, 2, 3].
class Fixnum
  def fibonacci_numbers
    a = [1, 1]
    return a[0..self] if self <= 2

    rest = (self-1).fibonacci_numbers

    rest + [rest[-2..-1].reduce(:+)]
  end
end

p 4.fibonacci_numbers == [1, 1, 2, 3]

# Recursively implement a Fixnum method that raises the receiver to the
# given power. Your algorithm should require only log(n) steps, where
# n is the given power.
class Fixnum
  def fast_exponent(power)
    return 1 if power == 0
    return self if power == 1

    self*(self.fast_exponent(power-1))
  end
end

p 4.fast_exponent(3)
p 2.fast_exponent(5)

# Recursively implement an Array method that performs a binary search
# for the target, returning nil if the target is not found and otherwise
# returning the first index where it is found. For example, calling
# your method on [1, 7, 4, 3, 5] with target 4 should return 2.
class Array
  def binary_search(target)
    arr = self.dup
    arr.sort!
    return nil if arr.empty?

    mid_idx = arr.length/2
    mid_val = arr[mid_idx]

    return mid_idx if mid_val == target

    if target > mid_val
      rest = arr[(mid_idx+1)..-1].binary_search(target)
      return rest if rest.nil?
      (mid_idx + 1) + rest
    else
      arr[0...mid_idx].binary_search(target)
    end
  end
end

p [1, 7, 4, 3, 5].binary_search(4)
puts [1, 2, 3].binary_search(1) == 0
puts [2, 3, 4, 5].binary_search(3) == 1
puts [2, 4, 6, 8, 10].binary_search(6) == 2
puts [1, 3, 4, 5, 9].binary_search(5) == 3
puts [1, 2, 3, 4, 5, 6].binary_search(6) == 5
puts [1, 2, 3, 4, 5, 6].binary_search(0) == nil
puts [1, 2, 3, 4, 5, 7].binary_search(6) == nil

# Implement a String method that returns an array of the receiver's
# substrings that belong to the given dictionary. For example, calling
# your method on 'catoodog' with dictionary ['at', 'cat', 'do', 'dog',
# 'to', 'too'] should return the entire dictionary.
class String
  def subwords(dictionary)
    working_str = self.dup
    return working_str if working_str.length <= 1

    end_point = working_str.length

    res = []
    front = 0
    until front == end_point
      back = -1
      until back.abs == end_point
        chunk = working_str[front..back]
        res << chunk if dictionary.include?(chunk)
        back -= 1
      end
      front += 1
    end
    res.sort
  end
end

p 'catoodog'.subwords(['at', 'cat', 'do', 'dog', 'to', 'too']) == ['at', 'cat', 'do', 'dog', 'to', 'too']

# Implement an Array method that accepts a comparator block and bubble-
# sorts the reciever according to the ordering defined by the comparator.
class Array
  def bubble_sort
    arr = self.dup
    sorted = false
    until sorted
      sorted = true
      arr.each_with_index do |term, index|
        next if (index + 1) == arr.length
        next_term = arr[index + 1]
        if term > next_term
          arr[index], arr[index+1] = next_term, term
          sorted = false
        end
      end
    end
    arr
  end

  def bubble_sort_blk(&blk)
    arr = self.dup
    sorted = false
    until sorted
      sorted = true
      arr.each_with_index do |term, index|
        next if (index + 1) == arr.length
        next_term = arr[index + 1]
        if blk.call(term, next_term) == -1
          arr[index], arr[index+1] = next_term, term
          sorted = false
        end
      end
    end
    arr
  end
end

p "Bubble Sort"

p (0..10).to_a.shuffle.bubble_sort == (0..10).to_a
p (0..10).to_a.shuffle.bubble_sort { |a,b| a <=> b } == (0..10).to_a

def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end

# write a function caesar_cipher(str, shift)
# THIS IS A SPECIAL CHIPHER. Say alphabet = ('a'..'z').to_a. Instead of maping
# alphabet[n] => alphabet[n + shift], map alphabet[n] => alphabet[n * shift].
# you should still wrap your index if it becomes larger than 25.
# Assume lowercase and no punctuation. Preserve spaces.

def caesar_cipher(str, shift)
  cipher = ("a".."z").to_a

  result = ""
  str.chars.each do |char|
    if char == " "
      result << char
    else
      shifted_idx = cipher.index(char) * shift % cipher.length
      result << cipher[shifted_idx]
    end
  end
  result
end

printer("caesar_cipher")
puts "test0: " + (caesar_cipher("a", 1) == "a").to_s
puts "test1: " + (caesar_cipher("a", 1000) == "a").to_s
puts "test2: " + (caesar_cipher("c", 3) == "g").to_s
puts "test3: " + (caesar_cipher("m", 4) == "w").to_s
puts "test4: " + (caesar_cipher("hello world", 10) == "soggk mkoge").to_s
puts "test5: " + (caesar_cipher("hello world", 25) == "twppm emjpx").to_s
puts

# write your own implementation of Enumerable#chunk_while. chunk_while
# should place elements in chunks if they are related according to the block.
# then return an array of chunks. See tests for examples or look up man page

class Array
  def my_chunk_while(&prc)
    chunks = []
    chunks << [first] unless empty?

    0.upto(length - 2) do |i|
      if prc.call(self[i], self[i + 1])
        chunks.last << self[i + 1]
      else
        chunks << [self[i + 1]]
      end
    end
    chunks
  end
end

printer("my_chunk_while")
a = [1,2,4,9,10,11,12,15,16,19,20,21]
puts "test0: " + (a.my_chunk_while {|i, j| i + 1 == j } ==
  [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]).to_s
a = [1,2,4,5,7,8,10,12,15,16,18,20,21]
puts "test1: " + (a.my_chunk_while {|i, j| j % 2 == 0 } ==
  [[1, 2, 4], [5], [7, 8, 10, 12], [15, 16, 18, 20], [21]]).to_s
a = [1,12,29,5,7,18,10,12,15,16,18,20,4]
puts "test2: " + (a.my_chunk_while {|i, j| i < j } ==
    [[1, 12, 29], [5, 7, 18], [10, 12, 15, 16, 18, 20], [4]]).to_s
puts

# write a reverse_num method for the Integer class. reverse_num should return
# the number with its digits in reverse order. TRY NOT TO USE ANY DATA
# STRUCTURES! It can be done without using String or Array. Only use Fixnum
# and operations like: :+, :*, :/, :%, and :**

class Fixnum
  def reverse_num
    return self if self < 10
    last_digit = self % 10
    rest = self / 10
    last_digit * (10 ** rest.num_digits) + rest.reverse_num
  end

  def num_digits
    num = self
    num_digits = 0
    until num <= 0
      num_digits += 1
      num /= 10
    end
    num_digits
  end
end

printer("reverse_num")
puts "test0: " + (0.reverse_num == 0).to_s
puts "test1: " + (5.reverse_num == 5).to_s
puts "test2: " + (564.reverse_num == 465).to_s
puts "test3: " + (78459.reverse_num == 95487).to_s
puts "test4: " + (64238798.reverse_num == 89783246).to_s
puts

# write a merge_sort and quick_sort that both accept an optional block.
# block should be {|n1, n2| n1 <=> n2} by default

class Array
  def quick_sort(&prc)
    prc ||= Proc.new {|n1, n2| n1 <=> n2}
    return self if self.length <= 1

    dup_arr = dup
    pivot = dup_arr.shift

    left = dup_arr.select {|el| prc.call(el, pivot) == -1}
    right = dup_arr.select {|el| prc.call(el, pivot) >= 0}

    left.quick_sort(&prc) + [pivot] + right.quick_sort(&prc)
  end

  def merge_sort(&prc)
    prc ||= Proc.new {|n1, n2| n1 <=> n2}
    return self if self.length <= 1

    mid_idx = length / 2
    left = self[0...mid_idx].merge_sort(&prc)
    right = self[mid_idx..-1].merge_sort(&prc)

    Array.merge_arrays(left, right, &prc)
  end

  def self.merge_arrays(left, right, &prc)
    merged_arr = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        merged_arr << left.shift
      else
        merged_arr << right.shift
      end
    end
    merged_arr.concat(left).concat(right)
  end
end

printer("merge/quick_sort")
suff_arr = (1..100).to_a.shuffle
sort_arr = (1..100).to_a
rev_sort_arr = (1..100).to_a.reverse
puts "test0: " + (suff_arr.quick_sort == sort_arr).to_s
puts "test1: " + (suff_arr.merge_sort == sort_arr).to_s
puts "test2: " + (suff_arr.quick_sort {|n1, n2| n2 <=> n1} == rev_sort_arr).to_s
puts "test3: " + (suff_arr.merge_sort {|n1, n2| n2 <=> n1} == rev_sort_arr).to_s
puts

# adapt your merge_sort method so that it splits the array into THREE subarrys
# and then calls merge_sort on each. The THREE sorted arrays should then be
# merged into one and returned.
# The merge step will be difficult to implement. I had to use two helper
# methods. One to compare elements and the other to tell me when im done merging

class Array
  def tri_merge_sort(&prc)
    prc ||= Proc.new {|n1, n2| n1 <=> n2}
    return self if self.length <= 1

    mid1_idx = length / 3
    mid2_idx = length * 2 / 3
    left = self[0...mid1_idx].tri_merge_sort(&prc)
    middle = self[mid1_idx...mid2_idx].tri_merge_sort(&prc)
    right = self[mid2_idx..-1].tri_merge_sort(&prc)

    Array.merge_arrays(left, middle, right, &prc)
  end

  def self.merge_arrays(left, middle, right, &prc)
    merged_arr = []
    until Array.two_empty?(left, middle, right)
      min_el = Array.min(left[0], middle[0], right[0], &prc)
      if min_el == left[0]
        merged_arr << left.shift
      elsif min_el == middle[0]
        merged_arr << middle.shift
      else
        merged_arr << right.shift
      end
    end
    merged_arr.concat(left).concat(middle).concat(right)
  end

  def self.two_empty?(left, middle, right)
    (left.empty? && middle.empty?) ||
      (middle.empty? && right.empty?) ||
      (left.empty? && right.empty?)
  end

  def self.min(*elements, &prc)
    min_el = nil
    elements.each do |el|
      next unless el
      if min_el.nil? || prc.call(el, min_el) == -1
        min_el = el
      end
    end
    min_el
  end
end

printer("tri_merge_sort")
suff_arr = (1..100).to_a.shuffle
puts "test0: " + (suff_arr.tri_merge_sort == (1..100).to_a).to_s
puts "test1: " + (suff_arr.tri_merge_sort {|n1, n2| n2 <=> n1} == (1..100).to_a.reverse).to_s
puts

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
  alphabet ||= ('a'..'z').to_a
  res = ""
  str.chars.each do |letter|
    if letter == " "
      res += letter
    else
      old_idx = alphabet.index(letter)
      new_idx = old_idx*shift % 26
      res += alphabet[new_idx]
    end
  end
  res
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
    res = []
    chunk = []
    self.each do |term|
      truthy = prc.call(chunk.last, term) unless chunk.empty?
      if chunk.empty? || truthy
        chunk << term
      else
        res << chunk
        chunk = [term]
      end
    end
    res << chunk unless chunk.empty?
    res
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
    num = self
    total = 0
    until num == 0
      total *= 10
      total += num%10
      num = num/10
    end
    total
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
    arr = self.dup
    return arr if arr.length <= 1
    prc ||= Proc.new { |n1, n2| n1 <=> n2 }
    pivot = arr.pop

    left = arr.select { |term| prc.call(term, pivot) == -1 }
    right = arr.select { |term| prc.call(term, pivot) == 0 || prc.call(term, pivot) == 1 }

    left.quick_sort(&prc) + [pivot] + right.quick_sort(&prc)
  end


  def merge_sort(&prc)
    arr = self.dup
    return arr if arr.length <= 1

    prc ||= Proc.new { |n1, n2| n1 <=> n2 }

    mid_idx = arr.length/2
    left = arr[0...mid_idx]
    right = arr[mid_idx..-1]

    Array.merge_arrays(left.merge_sort(&prc), right.merge_sort(&prc), &prc)

  end

  def self.merge_arrays(left, right, &prc)

    res = []

    until left.empty? || right.empty?
      prc_call = prc.call(left.first, right.first)
      if prc_call == -1
        res << left.shift
      else
        res << right.shift
      end
    end
    res + left + right
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
    return self if self.length <= 1

    prc ||= Proc.new { |a,b| a <=> b }

    first_idx = self.length/3
    sec_idx = (self.length * 2)/3


    left = self[0...first_idx]
    middle = self[first_idx...sec_idx]
    right = self[sec_idx..-1]

    Array.merge_arrays(left.tri_merge_sort(&prc), middle.tri_merge_sort(&prc), right.tri_merge_sort(&prc), &prc)
  end

  def self.merging_done?(*arrays)
    count = 0
    arrays.each { |array| count += 1 if array.empty? }
    count == 2
  end

  def self.merge_arrays(left, middle, right, &prc)

    res = []
    until Array.merging_done?(left, middle, right)
      new_items = [left.first, middle.first, right.first]
      new_piece = Array.loop_check(new_items, &prc)
      which_array = new_items.index(new_piece)
      if which_array == 0
        res << left.shift
      elsif which_array == 1
        res << middle.shift
      else
        res << right.shift
      end
    end
    res + left + middle + right
  end

  def self.loop_check(items, &prc)
    res = nil
    items.each do |item|
      next if item.nil?
      if res.nil? || prc.call(res, item) == 1
        res = item
      end
    end
    res
  end

end

printer("tri_merge_sort")
suff_arr = (1..100).to_a.shuffle
puts "test0: " + (suff_arr.tri_merge_sort == (1..100).to_a).to_s
puts "test1: " + (suff_arr.tri_merge_sort {|n1, n2| n2 <=> n1} == (1..100).to_a.reverse).to_s
puts

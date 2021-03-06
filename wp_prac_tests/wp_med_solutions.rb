def printer(problem_name)
  string1 = "#{"="*15} #{problem_name} #{"="*15}"
  string2 = "#{"=" * string1.length }"
  puts string1
  puts string2
  puts
end

# alphabetical takes a string and an alphabet. It returns true if the string
# is in alphabetical order according to the alphabet. If no alphabet is passed
# in, it defaults to normal alphabetical order (a-z).

def alphabetical(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  0.upto(str.length - 2) do |i|
    return false if alphabet.index(str[i]) > alphabet.index(str[i + 1])
  end
  true
end

printer("alphabetical")
my_alphabet = ["g", "v", "n", "p", "q", "a", "x", "c", "l", "k", "u", "o",
   "h", "i", "j", "b", "y", "w", "d", "r", "e", "m", "s", "z", "t", "f"]
puts "test0: " + (alphabetical("cat") == false).to_s
puts "test1: " + (alphabetical("ghost") == true).to_s
puts "test2: " + (alphabetical("quiz", my_alphabet) == true).to_s
puts "test3: " + (alphabetical("first", my_alphabet) == false).to_s
puts

# recursively determine if a string is symmetrical. Whitespace should be
# ignored. ( Hint: use gsub(/\s+/, "") ) Make sure to use recursion!

class String
  def rec_symmetrical?
    no_space_str = gsub(/\s+/, "")
    return true if no_space_str.length <= 2

    no_space_str[0] == no_space_str[-1] &&
      no_space_str[1..-2].rec_symmetrical?
  end
end

printer("rec_symmetrical")
puts "test0: " + ("race car".rec_symmetrical? == true).to_s
puts "test1: " + ("my dog".rec_symmetrical? == false).to_s
puts "test2: " + ("too hot to hoot".rec_symmetrical? == true).to_s
puts "test3: " + ("i like apples".rec_symmetrical? == false).to_s
puts

# Write a new Array method that will return
# the location of all identical elements. The keys are the
# duplicated elements, and the values are arrays of their positions,
# sorted lowest to highest.

class Array
  def dups
    dups = {}
    self.each_with_index do |num, idx|
      if dups.has_key?(num)
        dups[num] << idx
      else
        dups[num] = [idx]
      end
    end
    dups.delete_if {|k, v| v.length < 2}
    dups
  end
end

printer("dups")
puts "test0: " + ([1, 3, 0, 1].dups == { 1 => [0, 3] }).to_s
puts "test1: " + ([1, 3, 0, 3, 1].dups == { 1 => [0, 4], 3 => [1, 3] }).to_s
puts "test2: " + ([1, 3, 4, 3, 0, 3].dups == { 3 => [1, 3, 5] }).to_s
puts "test3: " + ([1, 3, 4, 5].dups == {}).to_s
puts

# Write a recursive implementation of a method that returns the
# first `n` factorial numbers.
# Be aware that the first factorial number is 0!, which is defined to
# equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [] if num <= 0
  return [1] if num <= 1
  prev_factorials = factorials_rec(num - 1)
  prev_factorials + [prev_factorials.last * (num - 1)]
end

printer("factorials_rec")
puts "test0: " + (factorials_rec(0) == []).to_s
puts "test1: " + (factorials_rec(1) == [1]).to_s
puts "test2: " + (factorials_rec(6) == [1, 1, 2, 6, 24, 120]).to_s
puts

# implement a binary_search that returns the index of the target element.
# should return nil if no element is found that matches

class Array
  def binary_search(target)
    return nil if empty?

    mid_idx = length / 2
    if target == self[mid_idx]
      mid_idx
    elsif target < self[mid_idx]
      self[0...mid_idx].binary_search(target)
    else
      left_idx = self[(mid_idx + 1)..-1].binary_search(target)
      left_idx ? mid_idx + 1 + left_idx : nil
    end
  end
end

printer("binary_search")
a = (0..10).to_a
puts "test0: " + (a.binary_search(3) == 3).to_s
puts "test1: " + (a.binary_search(9) == 9).to_s
a = Array.new(10) {|idx| idx * 3}
puts "test2: " + (a.binary_search(3) == 1).to_s
puts "test3: " + (a.binary_search(9) == 3).to_s
puts "test4: " + (a.binary_search(7) == nil).to_s
puts

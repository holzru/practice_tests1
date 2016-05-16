class TrueClass
  def passed?
    return "PASSED!" if self
    return "FAILED!" unless self
  end
  def passed_phrase
    passed_phrases = ["XDDD", "I knew you could do it, sempai!",
                      "You make me so proud!",
                      "You are as smart as you are handsome",
                      "Definitely not baka",
                      "You're so kawaii!",
                      "You must have many girlfriends",
                      "~~uguu~"]
    failed_phrases = ["You'll get it next time for sure!",
                      "...but never give up!",
                      "Remember everyone is counting on you, sempai!!!",
                      "Never surrender!",
                      "TT__TT",
                      "Time to commit honorable sudoku..."]
    return passed_phrases.sample if self
    return failed_phrases.sample unless self
  end
end
class FalseClass
  def passed?
    return "PASSED!" if self
    return "FAILED!" unless self
  end
  def passed_phrase
    passed_phrases = ["XDDD", "I knew you could do it, sempai!",
                      "You make me so proud!",
                      "You are as smart as you are handsome",
                      "Definitely not baka",
                      "You're so kawaii!",
                      "You must have many girlfriends",
                      "~~uguu~"]
    failed_phrases = ["You'll get it next time for sure!",
                      "...but never give up!",
                      "Remember everyone is counting on you, sempai!!!",
                      "Never surrender!",
                      "TT__TT",
                      "Time to commit honorable sudoku..."]
    return passed_phrases.sample if self
    return failed_phrases.sample unless self
  end
end
def test_1(array)
  array.flatten == array.flatten_rec
end
def test_2(limit)
  current_num = 1
  (1...limit).each do |num|
    i = 0
    (2...num).each do |factor|
       i += 1 if num % factor == 0
    end
    current_num = num if i == 0
  end
  current_num == biggest_prime(limit)
end
def test_3(array)
  array.my_uniq == array.uniq
end
def test_4(array)
  array.sort == array.quick_sort
end
def test_5(array)
  array.my_select{|x| x < 5} == array.select{|x| x < 5}
end
def test_6(array, target)
  array.index(target) == array.binary_search(target)
end

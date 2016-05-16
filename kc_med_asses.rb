# Fall and Winter Birthdays
# ------------------------------------------------------------------------------
# Given a list of students and what month their birthday is, return all the pairs
# of students whose birthdays both fall in the second half of the year.  Months
# are numbers, and assume that July (month 7) and later is the second half of
# the year.
#
# Only count pairs once, and work from the beginning of the list to the end.
#

def fall_and_winter_birthdays(students_with_birthdays)
    #
    # your code goes here
    #
end

students_with_birthdays_1 = [
["Asher", 6],
["Bertie", 11],
["Dottie", 8],
["Warren", 9]
]

second_half_birthday_pairs_1 = [
["Bertie", "Dottie"],
["Bertie", "Warren"],
["Dottie", "Warren"]
]

students_with_birthdays_2 = [
["Asher", 6],
["Bertie", 11],
["Dottie", 8],
["Warren", 9],
["Charlie", 7],
["Nassim", 4],
["Ajit", 10],
]

second_half_birthday_pairs_2 = [
["Bertie", "Dottie"],
["Bertie", "Warren"],
["Bertie", "Charlie"],
["Bertie", "Ajit"],
["Dottie", "Warren"],
["Dottie", "Charlie"],
["Dottie", "Ajit"],
["Warren", "Charlie"],
["Warren", "Ajit"],
["Charlie", "Ajit"],
]

puts "-------Fall and Winter Birthdays-------"
puts fall_and_winter_birthdays(students_with_birthdays_1) == second_half_birthday_pairs_1
puts fall_and_winter_birthdays(students_with_birthdays_2) == second_half_birthday_pairs_2


# One-week Wonders
# ------------------------------------------------------------------------------
# Given a list of songs at the top of the charts, return the songs that only
# stayed on the chart for a week at a time.
#
# Songs CAN reappear on the chart, as long as it's for a week at a time. Only
# count those songs once.
#
# Suggested strategy: find the songs that show up multiple times in a row and
# subtract them out.

def one_week_wonders(songs)
    #
    # your code goes here
    #
end

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]

puts "-------One Week Wonders-------"
puts one_week_wonders(top_hits_1) == one_week_wonders_1
puts one_week_wonders(top_hits_2) == one_week_wonders_2


# Given a perfectly respectable business sign, determine if pranksters George
# and Harold can make a vandalized sign out of it using the same or fewer letters.
# Ignore capitalization and punctuation.

def can_tweak_sign?(normal_sign, vandalized_sign)
    #
    # your code goes here
    #
end

puts "-------Sign Tweakers-------"
puts can_tweak_sign?("Come in and see our pretty armchairs", "Come and see our hairy armpits") == true
puts can_tweak_sign?("Student and teacher art fair starts Wed.", "Teacher farts stain underwear") == true
puts can_tweak_sign?("Choose the bread of life or you are toast", "Teacher farts stain underwear") == false

#bubble sort with a proc
class Array
    def bubble_sort(&prc)
    end
end

puts bubble_sort([5,4,31,5,2]) == [2,4,5,5,31]
puts bubble_sort([5,42,1,2,3]) == [1,2,3,5,42]
puts bubble_sort([1,2,3,4,5]) { |num1, num2| num2 <=> num1 } == [5,4,3,2,1]

#gamma function problem, google if you don't know what it is
def gamma_fnc(num)
end

# Test Cases
gamma_fnc(0)   == nil
gamma_fnc(1)   ==  1
gamma_fnc(4)   ==  6
gamma_fnc(8)   == 5040



describe "#dups" do
    # Write a new Array method (using monkey-patching) that will return
    # the location of all identical elements. The keys are the
    # duplicated elements, and the values are arrays of their positions,
    # sorted lowest to highest.
    
    it "solves a simple example" do
        expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
    end
    
    it "finds two dups" do
        expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
    end
    
    it "finds multi-dups" do
        expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
    end
    
    it "returns {} when no dups found" do
        expect([1, 3, 4, 5].dups).to eq({})
    end
end


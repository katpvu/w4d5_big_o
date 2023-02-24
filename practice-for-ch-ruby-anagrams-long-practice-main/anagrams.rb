#phase 1 - generating all possible combinations; nested loop
#factiorial 3n!
def first_anagram?(str1, str2)
    permutation(str1).include?(str2)
end

def permutation(str)
    return [str] if str.length == 1
    previous_perms = permutation(str[0..-2])
    next_perms = []
    previous_perms.each do |perm|
        (0..perm.length).each do |i|
            next_perms << perm[0...i] + str[-1] + perm[i..-1]
        end 
    end
    next_perms
end

#phase 2 - linear O(3n)
def second_anagram?(str1, str2)
    str2_arr = str2.split("") #1st iteration
    str1.each_char do |char| #2nd iteration
        i = str2_arr.find_index(char)
        i.nil? ? false : str2_arr.delete_at(i)
    end
    str2_arr.empty? #3rd iteration
end

#phase 3 - using quicksort (2n log n)
def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end

#phase 4 linear (2n)
def fourth_anagram?(str1, str2)
    letter_count(str1) == letter_count(str2)
end

def letter_count(str)
    letters = Hash.new(0)
    str.each_char {|char| letters[char] += 1}
    letters
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
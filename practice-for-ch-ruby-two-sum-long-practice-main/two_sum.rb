#O(n^2)
def bad_two_sum?(arr, target)
    arr.each_with_index do |ele, i|
        arr.each_with_index do |ele2, i2|
            return true if i2> i && ele + ele2 == target
        end
    end

    false
end

def okay_two_sum?(arr, target)
    sorted = arr.sort
end

def two_sum?(arr, target)
    bank = {}

    arr.each do |num|
        dif = target - num
        if bank[dif]
            return true
        else
            bank[num] = true
        end
    end

    false
end

def

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


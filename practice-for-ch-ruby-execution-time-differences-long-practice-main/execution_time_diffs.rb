#phase I: quadratic O(n^2)
def my_bad_min(array)
    smallest = array.first
    array.each_with_index do |ele, i| # 0 
        array.each_with_index do |ele2, i2| # 3
            if i2 > i && ele < ele2
                smallest = ele if ele < smallest
            end

            # if i2 != i 
            #     next if ele > ele2
            #     return ele if i2 == array.length - 1 && ele < ele2
            # end
        end
    end
    smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_bad_min(list) # => 5


#phase II: linear O(n)
def my_good_min(array)
    smallest = array.first
    array.each { |ele| smallest = ele if ele < smallest }
    smallest
end

# p my_good_min(list) # => 5


#phase I: quadratic O(n^2)
def bad_largest_contiguous_subsum(array)
    subsets = []
    array.each_with_index do |ele, i|
        (0..i).each do |i2|
            subsets << array[i2..i]
        end
    end

    subsets.map {|subset| subset.sum }.max
end

# list = [5, 3, -7]
# p bad_largest_contiguous_subsum(list) # => 8

# list_1 = [2, 3, -6, 7, -6, 7]
# p bad_largest_contiguous_subsum(list_1) # => 8 (from [7, -6, 7])

# list_2 = [-5, -1, -3]
# p bad_largest_contiguous_subsum(list_2) # => -1 (from [-1])

#phase II:

def good_largest_contiguous_subsum(array)
    largest_sum = array.first
    current_sum = array.first
    
    (1...array.length).each do |i|
        if current_sum < 0
            current_sum = 0
        end

        current_sum += array[i]

        if current_sum > largest_sum
            largest_sum = current_sum
        end
    end

    largest_sum
end

list = [5, 3, -7]
p good_largest_contiguous_subsum(list) # => 8

list_1 = [2, 3, -6, 7, -6, 7]
p good_largest_contiguous_subsum(list_1) # => 8 (from [7, -6, 7])

list_2 = [-5, -1, -3]
p good_largest_contiguous_subsum(list_2) # => -1 (from [-1])



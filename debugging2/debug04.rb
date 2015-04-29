def char_count(list)
  letters = Array.new(list.length, 0)
  list.each do |word|
    word.split(//).each do |letter|
      letters[list.index(word)] += 1 
    end
  end
  return letters
end

# Why the long face(error)? 
# 1. This should return count of each letter in the list

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])


# 2. What are the improvements you can do to above code?
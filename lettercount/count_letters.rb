def count_letters(sentence)
  letters = Hash.new(0)
  sentence.split(//).each do |letter|
    letters[letter] += 1
  end
  puts letters.inspect
end

def count_letter_indices(sentence)
  letters = Hash.new{ |h,v| h[v]=[]}
  sentence.split(//).each_with_index do |letter,index|
    letters[letter] << index
  end
  puts letters.inspect
end

count_letter("cool beans")
count_letter_indices("cool beans")
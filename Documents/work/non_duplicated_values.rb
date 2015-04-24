def non_duplicated_values(values)
  puts values.find_all { |i| values.count(i) == 1 }
end

non_duplicated_values([1,2,2,4])
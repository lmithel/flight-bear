def benchmark
  start_time = Time.now
  result_from_block = yield
  return running_time = Time.now - start_time
end

long_string = "apple"*100000000
 
running_time = benchmark { long_string.reverse }
 
puts "string.reverse took #{running_time} seconds to run"
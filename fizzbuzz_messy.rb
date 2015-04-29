def fb(s, f)
    s.upto(f) { |i| puts e(i) }
end

def e(x)
  if div_3?(x) && div_5?(x)
    "FizzBuzz"
  elsif div_5?(x)
    "Buzz"
  elsif div_3?(x)
    "Fizz"
  else
    x
  end
end

def div_5?(x)
x % 5 == 0 
end

def div_3?(x) 
x % 3 == 0 
end

A = 60
B = 80

fb(A, B)

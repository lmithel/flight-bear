def fb(s, f)
<<<<<<< HEAD
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
=======
    s.upto(f) { |x|
      puts e(x)
    }
end

  def e(y)
    if div_3?(y) && div_5?(y)
        "FizzBuzz"
      elsif div_5?(y)
        "Buzz"
        elsif div_3?(y)
          "Fizz"
          else
            y
    end
  end

def div_5?(x); x % 5 == 0; end;

def div_3?(x1); x1 % 3 == 0; end;

a = 60
b = 80
fb(a, b)
>>>>>>> 1a7ed97213055675bc2e116f60c0984f33e6d2c4

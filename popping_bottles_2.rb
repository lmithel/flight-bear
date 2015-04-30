@currentbottles=0
@caps=0
@buckets=0
@capbottles=0
@bucketbottles=0

def bottles_total(investment)
  pop_total=investment/2
  bottles=investment/2
  while bottles > 1
  bottles = bottles*(0.75)
  pop_total += bottles
  end
  return pop_total
end

def drink(bottles)
  @caps = @caps + bottles
  @buckets = @buckets + bottles
  @currentbottles = 0
end

def recycle_caps()
  @currentbottles = @currentbottles + (@caps/4).floor
  @capbottles += (@caps/4).floor
  @caps = @caps%4
end

def recycle_buckets()
  @currentbottles += (@buckets/2).floor
  @bucketbottles += (@buckets/2).floor
  @buckets = @buckets%2
end

def bottles_total2(investment)
  @currentbottles = investment/2
  totbottles = 0
  while @currentbottles >= 2
    totbottles += @currentbottles
    drink(@currentbottles)
    recycle_caps()
    recycle_buckets()
  end
  return totbottles
end

open = true

while open
  puts "How much would you like to invest in BOTTLES?"
  investment = gets.chomp
    if investment == "quit"
      open = false
    else
      p "#{bottles_total(investment.to_i)} bottles"
      p "#{bottles_total2(investment.to_i)} bottles"
      puts @bucketbottles
      puts @capbottles
    end
end
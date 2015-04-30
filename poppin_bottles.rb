@emptybottles=0
@fullbottles=0
@caps=0
@buckets=0
@capbottles=0
@bucketbottles=0
@totbottles=0

def drink()
  puts "full bottles #{@fullbottles}"
  @totbottles+=@fullbottles
  @caps += @fullbottles
  @emptybottles += @fullbottles
  @fullbottles = 0
end

def recycle_caps()
  loop do 
    @fullbottles += (@caps/4).floor
    #@capbottles += (@caps/4).floor
    @caps = @caps%4
    drink()
  break if @caps < 4
  end
end

def recycle_bottles()
  loop do
  puts @emptybottles
  @fullbottles += (@emptybottles/2).floor
  @emptybottles = (@emptybottles%2)
  #@bucketbottles += (@emptybottles/2).floor
  drink()
  recycle_caps()
  break if @fullbottles < 2
  end
end

def bottles_total2(investment)
  @fullbottles = investment/2
  loop do
    drink()
    recycle_caps()
    recycle_bottles()
    break if @fullbottles < 2
  end
  return @totbottles
end

open = true

while open
  puts "How much would you like to invest in BOTTLES?"
  investment = gets.chomp
    if investment == "quit"
      open = false
    else
      p @capbottles
      p @bucketbottles
      p "#{bottles_total2(investment.to_i)} bottles"
    end
end
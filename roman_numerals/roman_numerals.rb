def to_roman(number)
  string = ""
  thous=(number/1000).floor
  for i in 1..thous
    string << "M"
  end
  fivehundos=((number%1000)/500).floor
  for i in 1..fivehundos
    string << "D"
  end
  hundos=((number%500)/100).floor
  for i in 1..hundos
    string << "C"
  end
  fitty=((number%100)/50).floor
  for i in 1..fitty
    string << "L"
  end
  dec=((number%50)/10).floor
  for i in 1..dec
    string << "X"
  end
  quint=((number%10)/5).floor
  for i in 1..quint
    string << "V"
  end
  uni=(number%5).floor
  for i in 1..uni
    string << "V"
  end
  puts string
end

to_roman(20)
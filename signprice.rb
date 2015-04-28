def basePrice(length,width)
  baseprice = length*width*15
end

def colorPrice(color_count)
  if color_count > 2
    colorprice = 10 * color_count
  else
    colorprice = 15 * color_count
  end
end

def tax(num)
  totalprice=num+num*0.15
end

def signPrice(length,width,color_count)
  tax(basePrice(length,width)+colorPrice(color_count))
end

puts signPrice(4,5,6)
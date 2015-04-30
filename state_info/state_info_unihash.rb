@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan'
}

@states["WA"]='Washington'
@states["ID"]='Idaho'

@cities = {
  OR: ['Oregon','Portland','Eugene'],
  FL: ['Florida', 'Orlando','Miami'],
  CA: ['California','San Francisco','LA','San Diego'],
  NY: ['New York City','Buffalo','Syracuse'],
  MI: ['Michigan', 'Detroit','Ann Arbor'],
  WA: ['Washington', 'Seattle', 'Olympia'],
  ID: ['Idaho','Boise','Twin Peaks']
}

@taxes = {
  OR: 7.5,
  FL: 5,
  CA: 9,
  NY: 8.5,
  MI: 6,
  WA: 7,
  ID: 4
}

def describe_state(state)
  state=state.to_sym
  puts numcities= @cities[state].length-1
  cities = @cities[state]
  statename=cities[0]
  cities.delete_at(0)

  puts "#{state} stands for #{statename} I can think of #{numcities} cities in #{statename}: #{cities.join(", ")}"
end

def calculate_taxes(state,amount)
  state=state.to_sym
  unless @taxes[state]==nil
  return amount*@taxes[state]*0.01
  end
  return "Not a State"
end

def find_state_for_city(city)
  city=city.to_sym
  here=@cities.select{|k,v| v.include?(city)}
  return here.keys
end

describe_state("OR")
#calculate_taxes(:POP,400)
#find_state_for_city("Olympia")
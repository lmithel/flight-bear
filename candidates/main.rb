# This is the main entrypoint into the program
# It requires the other files/gems that it needs
 
require 'pry'
require './candidates'
require './filters'
 

## Your test code can go here
def experienced? (candidate)
 candidate[:years_of_experience] > 2
end

def enough_github?(candidate)
  candidate[:github_points] >= 100
end

def enough_languages?(candidate)
  candidate[:languages].include?("Ruby") && candidate[:languages].include?("Python")
end

def applied_soon?(candidate)
  candidate[:date_applied] >=15.days.ago.to_date
end

def old?(candidate)
  candidate[:age] > 17
end


def find(id)
  puts id
 candidate = @candidates.select { |key,value| key[:id] == id.to_i}
 if candidate == []
  return "That user ID does not exist"
 else
  candidate
 end
end

def qualified_candidates(candidates)
    qualified = Hash.new()
    candidates.each_with_index do |(key,value),index|
     if experienced?(key)&&enough_github?(key)&&enough_languages?(key)&&applied_soon?(key)&&old?(key)
       puts qualified[index]=key
     end
    end
end

def ordered_by_qualifications(candidates)
    qualified_order_to_sort = Array.new()
    candidates.each do |candidate|
      #qualified_order << candidate
      qualified_order_to_sort << candidate
    end
   
    qualified_order = qualified_order_to_sort.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]]}
     pp qualified_order.reverse
    #puts qualified_order = candidates. { |candidates| candidates[:id]}
end



while true
puts "What would you like to do? (find x, all, qualified, quit)"
input = gets.chomp
  case input
  when /find\s(\d)/
    puts find($1)
  when "all"
    puts @candidates
  when "qualified"
    qualified=qualified_candidates(@candidates)
    puts ordered_by_qualifications(qualified)
  when "quit"
    break;
  end
end

#pp enough_languages?(@candidates[1])
#qualified_candidates(@candidates)

#puts find(5)
#ordered_by_qualifications(@candidates)
#pp @candidates
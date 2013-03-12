require "rubygems"
require "./compare"
require "./data/data"


ices, breakers = load_data

ice_type = ARGV[0]


rig = ["Battering Ram", "Gordian Blade", "Ninja"]
server_ice = ["Tollbooth", "Enigma", "Rototurret", "Wall of Static"]

total_cost = 0 
server_ice.each do | ice | 
    lowest_cost = 1000000000
    lowest_breaker = false
    rig.each do | breaker |
        cost = cost_to_break(breakers[breaker], ices[ice])
        if cost && cost <= lowest_cost
            lowest_cost = cost
            lowest_breaker = breaker
        end
    end
    if lowest_breaker
        total_cost += lowest_cost
        puts "\tBreaking #{ice} with #{lowest_breaker} for #{lowest_cost} credit(s)..."
    else
        puts "\nCOULD NOT BREAK #{ice}"
    end
end

puts "Total cost to break through all ice: #{total_cost} credits. "
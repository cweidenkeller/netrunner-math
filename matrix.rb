require "rubygems"
require "./compare"
require "./data/data"

ices, breakers = load_data
ice_type = ARGV[0]

print "\t"
breakers.each_pair do | name, breaker | 
    print "#{name}\t " if breaker[:type]==$ice_to_breaker[ice_type] || breaker[:type]=='ai'
end
print "\n"

ices.each_pair do | ice_name, ice |
    
        if ice[:type] == ice_type
            print "#{ice_name}\t"
            breakers.each_pair do | breaker_name, breaker | 
                cost = cost_to_break(breaker, ice)
                unless cost == nil
                
                    print "#{cost}\t "
                end
            end
            print "\n"
        end 
end
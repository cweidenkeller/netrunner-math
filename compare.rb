$ice_to_breaker = {
    "code_gate"=>"decoder",
    "barrier"=>"fracter",
    "sentry"=>"killer"
}

def cost_to_break breaker, ice
    
    

    # Can the breaker interact with it at all?
    unless breaker[:type]=="ai" || $ice_to_breaker[ice[:type]] == breaker[:type]
        return nil
    end

    cost = 0

    # Do we need to increase strength?
    if ice[:strength] > breaker[:strength]  

        # See if can can increase strength
        matched_strength = false
        breaker[:abilities].each do | ability | 
            if ability[:type] == "increase_strength"
                delta = ice[:strength] - breaker[:strength]  
                number_of_times_to_pump = (delta / ability[:strength].to_f).ceil
                cost += number_of_times_to_pump * ability[:cost]
                matched_strength = true
            end
        end

        # Are we good to go?
        unless matched_strength
            return "n/a"
        end
    end

    breaker[:abilities].each do | ability | 
        if ability[:type] == "break"
            subroutines = 0
            subroutines = ice[:subroutines].length if ice[:subroutines]
            number_of_times_to_break = (subroutines / ability[:break].to_f).ceil
            cost += number_of_times_to_break * ability[:cost]
        end
    end

    if cost.is_a?(Numeric)
        cost += ice[:strength] if breaker[:subtype] == "wyrm"
        cost += 3 if ice[:encounter] == "runner_pays_3"
        cost = 1 if ice[:subtype] == "advertisement" && cost > 0
    end

    return cost
end
###Usage

####Build a matrix for an ice type
```
$ ruby matrix.rb barrier
    Aurora   Battering Ram   Crypsis     Morning Star    Snowball    Wyrm    
Hadrian's Wall  8    7   9   n/a     8   19  
Heimdall 1.0    10   8   9   n/a     8   20  
Ice Wall    2    2   2   1   1   4   
Snowflake   4    3   4   1   3   8   
TMI 6    5   6   1   5   12  
Wall of Static  4    3   4   1   3   8   
Wall of Thorns  8    5   7   1   6   15
```

####Get the total cost of a run
```ruby math.rb 
    Breaking Tollbooth with Gordian Blade for 7 credit(s)...
    Breaking Enigma with Gordian Blade for 2 credit(s)...
    Breaking Rototurret with Ninja for 2 credit(s)...
    Breaking Wall of Static with Battering Ram for 3 credit(s)...
Total cost to break through all ice: 14 credits. 
```

TODO: 
    - Incorporate things like strength duration
    - Dynamic ice/rigs
    - Autobuild ice
    - Autobuild rig
    - Include install costs 
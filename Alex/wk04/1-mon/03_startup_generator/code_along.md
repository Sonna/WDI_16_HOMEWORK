```shell
    $ gem install pry
      Fetching: coderay-1.1.2.gem (100%)
      Successfully installed coderay-1.1.2
      Fetching: method_source-0.9.0.gem (100%)
      Successfully installed method_source-0.9.0
      Fetching: pry-0.11.3.gem (100%)
      Successfully installed pry-0.11.3
      3 gems installed

    $ gem list pry

      *** LOCAL GEMS ***

      pry (0.11.3)

    $ ruby /Users/Sonna/Projects/all/wdi/Alex/wk04/1-mon/03_startup_generator/startup_generator.rb           [12:41:53]

    From: /Users/Sonna/Projects/all/wdi/Alex/wk04/1-mon/03_startup_generator/startup_generator.rb @ line 21 :

        16: "Mitt Romney's Hair","Laundromats","Celebrity Gossip","Endangered Species","Pandas","Middle Schoolers","Alpha Phi Girls","Funeral Homes","Chinese Take-out","Ex-Convicts","Fast Casual Restaurants","Marketers","Qualifying Leads","Funeral Homes","Farmers","Cougars","Pilots","Gynecologists",
        17: "Cracked iPhone Apps","Stolen Goods","Adult Dancers","People Who Hate Groupon","Hunters","Sysadmins","Bath Salts","Nootropics","California","Government Corruption","Political Attack Ads","Whiskey Lovers","Parking Tickets","Highway Accidents","Traveling","Airlines","Presentation Tools","Your Boss","Ponzi Schemes","Your Finances","Restroom Attendants","Your Aquarium","Your Cat's Litter Box","Pets","Alcoholics",
        18: "Camp Counselors","Nature Blogs","World of Warcraft","Models","Family Guy Enthusiasts","The Army","Cheap Vodka","Tech Incubators","Star Trek Conventions","Presentation Tools","Small Businesses","Beer","Nightclub Lines","Semi-Active Volcanoes", "Sanctimonial Artifacts","Traveling Abroad","Your Mom","Billionaires","Happy Hours","Ugg Boots","The Homeless","Blacking Out","Red Wine","Happy Families","Social Outcasts",
        19: "Surgeons","Pounding Jagger Bombs","Textbooks","Coffee Shops","Baristas"]
        20:
     => 21: binding.pry
        22:
        23: puts("hello slackers")
        24:
        25: puts "#{this_array.sample} #{that_array.sample}"
        26: # >> Appstore Mitt Romney's Hair

    [1] pry(main)> this_array.length
    => 90
    [2] pry(main)> that_array.length
    => 76
    [3] pry(main)> that_array.shuffle
    => ["Traveling",
     "Social Outcasts",
     "Cougars",
     "Nature Blogs",
     "Cracked iPhone Apps",
     "Nightclub Lines",
     "Your Boss",
     "Pilots",
     "California",
     "Marketers",
     "Pounding Jagger Bombs",
     "Funeral Homes",
     "Baristas",
     "Surgeons",
     "Your Finances",
     "Ugg Boots",
     "Chinese Take-out",
     "Adult Dancers",
     "Government Corruption",
     "Happy Families",
     "Red Wine",
     "Facebook Platform",
     "Presentation Tools",
     "Small Businesses",
     "Ex-Convicts",
     "Alcoholics",
     "Your Aquarium",
     "The Army",
     "Endangered Species",
     "Parking Tickets",
     "People Who Hate Groupon",
     "Coffee Shops",
     "Star Trek Conventions",
     "World of Warcraft",
     "Camp Counselors",
     "Traveling Abroad",
     "Models",
     "Whiskey Lovers",
     "Tech Incubators",
     "Your Cat's Litter Box",
     "Celebrity Gossip",
     "Your Mom",
     "Pandas",
     "Sysadmins",
     "Blacking Out",
     "Qualifying Leads",
     "Alpha Phi Girls",
     "Cheap Vodka",
     "Middle Schoolers",
     "Stolen Goods",
     "Restroom Attendants",
     "Farmers",
     "Ponzi Schemes",
     "Erlang Enthusiasts",
     "Textbooks",
     "Gynecologists",
     "Billionaires",
     "Airlines",
     "The Homeless",
     "Hunters",
     "Bath Salts",
     "Sanctimonial Artifacts",
     "Semi-Active Volcanoes",
     "Beer",
     "Nootropics",
     "Ex-Girlfriends",
     "Funeral Homes",
     "Happy Hours",
     "Family Guy Enthusiasts",
     "Political Attack Ads",
     "Highway Accidents",
     "Pets",
     "Mitt Romney's Hair",
     "Fast Casual Restaurants",
     "Presentation Tools",
     "Laundromats"]
    [4] pry(main)> that_array.sample()
    => "Qualifying Leads"
    [5] pry(main)> that_array.sample()
    => "Erlang Enthusiasts"
    [6] pry(main)>
```

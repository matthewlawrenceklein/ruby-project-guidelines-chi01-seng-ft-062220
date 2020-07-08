$prompt = TTY::Prompt.new

def welcome
    # puts $greeting.colorize(:color => :light_blue)
    answer = $prompt.select("Welcome to BIG SPORTS CLI", "NEW USER", "EXISTING USER")
        case
        when answer == "NEW USER"
            puts "Whats your name?"
            print "> "
            name = gets.chomp
            $user = User.create(name: name)
            puts "Your user ID is #{$user.id}, please remember this number!"
        when answer == "EXISTING USER"
            puts "Please enter your user ID"
            print "> "
            id = gets.chomp
            $user = User.all.find{ |user| user.id == id.to_i }
            
            puts "Welcome back #{$user.name}"
        end
end

def display_options
    $options_response = $prompt.select("Main Menu", "FIND MATCHES BY STADIUM", "FIND MATCHES BY TEAM", "MY FAVORITES", "EXIT")
end

def user_input
    case
        when $options_response == 'FIND MATCHES BY STADIUM'
            puts "What stadium would you like to find?"
            print "> "
            stadium = gets.chomp 
            Match.sort_by_location(stadium)
            add_to_favorites()

        when $options_response == 'FIND MATCHES BY TEAM'
            puts "What team would you like to find?"
            print "> "
            team = gets.chomp 
            Match.sort_by_team(team)
            add_to_favorites()

        when $options_response == 'MY FAVORITES' 
            $user.matches.each do |match|
                ap "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location}."
            end
                def favorites_menu
                    favorites_response = $prompt.select("What would you like to do?", "Sort by home team", "Sort by stadium", "Remove favorite", "Return to main menu" )
                    
                    case 
                    when favorites_response == "Remove favorite"
                        puts "Please select a match to remove by ID"
                        match_remove = gets.chomp
                        $user.remove_favorite(match_remove)
                        
                    when favorites_response == "Return to main menu"
                        display_options()
                        user_input()    
    
                    when favorites_response == "Sort by home team"
                        puts "~" * 20
                        home_sorted = $user.matches.sort_by { |match| match.home_team }
                        home_sorted.each { |match| ap "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location}" }
                        favorites_menu()
    
                    when favorites_response == "Sort by stadium"
                        puts "~" * 20
                        stadium_sorted = $user.matches.sort_by { |match| match.location}
                        stadium_sorted.each { |match| ap  "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location}" }
                        favorites_menu()
                    end
                end
                favorites_menu()
        when $options_response == "EXIT"
            exit 
        end

end

def add_to_favorites

   answer = $prompt.select("Would you like to add a match to your favorites?", "YES", "NO")
        case
        when answer == "YES"
            puts "Please select a match by ID"
            print "> "
            number = gets.chomp 
            Favorite.create(user_id: $user.id, match_id: number)
            puts "your favorites are now:"
            $user.matches.each { |match| ap "#{match.home_team} play #{match.away_team} at #{match.location}." }

            display_options()
            user_input()
        when answer == "NO"
            display_options()
            user_input()
        end
end
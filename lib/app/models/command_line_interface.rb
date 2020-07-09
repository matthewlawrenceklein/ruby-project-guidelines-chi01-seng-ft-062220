$prompt = TTY::Prompt.new

def welcome
    # puts $greeting.colorize(:color => :light_blue)
    answer = $prompt.select("""WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64
WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64
WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64
WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64
WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64
WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64 || WELCOME TO SOCCER BUDDY 64""".colorize(:color => :black, :background => :light_green), "NEW USER", "EXISTING USER")
        case
        when answer == "NEW USER"
            puts "Whats your name?".colorize(:color => :black, :background => :light_green)
            print "> "
            name = gets.chomp
            $user = User.create(name: name)
            welcomeUser = TTY::Box.success("Your user ID is #{$user.id}, please remember this number!")
            print welcomeUser
        when answer == "EXISTING USER"
            puts "Please enter your user ID"
            print "> "
            answer_id = gets.chomp   
            allIds = []
            User.all.each {|user| allIds << user.id}

            if allIds.include?(answer_id.to_i)
                    $user = User.all.find{ |user| user.id == answer_id.to_i }    
                    welcomeExistingUser = TTY::Box.success("Welcome back #{$user.name}")
                    print welcomeExistingUser
                else puts "USER ID NOT FOUND SORRY FRIEND"
                    welcome()
            end
        end
end

def display_options
    $options_response = $prompt.select("Main Menu".colorize(:color => :black, :background => :light_green), "FIND MATCHES BY STADIUM", "FIND MATCHES BY TEAM", "MY FAVORITES", "EXIT")
end

def user_input
    case
        when $options_response == 'FIND MATCHES BY STADIUM'
            instructionFindMatches = TTY::Box.info("Please enter a stadium and city (IE 'Vitality Stadium, Bournemouth')")
            print instructionFindMatches
            print "> "
            stadium = gets.chomp 
            Match.sort_by_location(stadium)
            add_to_favorites()

        when $options_response == 'FIND MATCHES BY TEAM'
            instructionFindTeam = TTY::Box.info("What team would you like to find?")
            print instructionFindTeam
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
                        $user.remove_favorite(match_remove.to_i)
                        $user.reload
                        system('clear')
                        puts "REMOVED"
                        favoriteMatchesAre = TTY::Box.info("your favorites are now:")
                        print favoriteMatchesAre 
                        $user.matches.each { |match| ap "#{match.home_team} play #{match.away_team} at #{match.location}." }
                       

                        favorites_menu()
                        
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
            system('clear')
            exit 
        end

end

def add_to_favorites

   answer = $prompt.select("Would you like to add a match to your favorites?".colorize(:color => :black, :background => :light_green), "YES", "NO")
        case
        when answer == "YES"
            puts "Please select a match by ID"
            print "> "
            number = gets.chomp 
            system('clear')
            Favorite.create(user_id: $user.id, match_id: number)
            favoriteMatchesAre = TTY::Box.info("your favorites are now:")
            print favoriteMatchesAre 
            $user.reload
            $user.matches.each { |match| ap "#{match.home_team} play #{match.away_team} at #{match.location}." }
            
            display_options()
            user_input()
        when answer == "NO"
            system('clear')
            display_options()
            user_input()
        end
end
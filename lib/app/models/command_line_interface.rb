### DEFINE AP TEXT OBJECTS HERE ***


###################################
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
    $options_response = $prompt.select("Main Menu", "FIND MATCHES BY DATE", "FIND MATCHES BY TEAM", "MY FAVORITES", "EXIT")
end

def user_input
    case
        when $options_response == 'FIND MATCHES BY DATE'
            puts "What team would you like to find?"
            print "> "
            date = gets.chomp 
            Match.sort_by_date(date)
            add_to_favorites()

        when $options_response == 'FIND MATCHES BY TEAM'
            puts "What team would you like to find?"
            print "> "
            team = gets.chomp 
            Match.sort_by_team(team)
            add_to_favorites()

        when $options_response == 'MY FAVORITES' 
            $user.matches.each do |match|
                ap "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location} on #{match.date}, starting at #{match.start_time}"
            end
                remove_response = $prompt.select("Would you like to remove any favorites?", "YES", "NO" )
                
                case 
                when remove_response == "YES"
                    puts "Please select a match to remove by ID"
                    match_remove = gets.chomp
                    $user.remove_favorite(match_remove)
                    
                when remove_response == "NO"
                    puts "super nice"
                    user_input()                    
                end
                # puts "Would you like to remove any favorites Y/N?"
                # #TODO write out removal user input logic
                # answer = gets.chomp
                #     if answer == "Y"
                #         #TODO delete logic
                #     elsif answer == 'N'
                #         user_input()
                #     else
                #         puts "Sorry, improper input."
                #         user_input()
                #     end
        when $options_response == "EXIT"
            exit 
        end

end

def add_to_favorites

   answer = prompt.select("Would you like to add a match to your favorites?", "YES", "NO")
        case
        when answer == "YES"
            puts "Please select a match by ID"
            print "> "
            number = gets.chomp 
            Favorite.create(user_id: $user.id, match_id: number)
            puts "your favorites are now:"
            puts $user.favorites 
            # $user.matches.each do |match|
            #     ap "#{match.home_team} play #{match.away_team} at #{match.location} on #{match.date}, starting at #{match.start_time}"
            # end

            display_options()
            user_input()
        when answer == "NO"
            display_options()
            user_input()
        end
end
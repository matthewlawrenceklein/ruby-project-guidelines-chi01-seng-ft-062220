### DEFINE AP TEXT OBJECTS HERE ***
$greeting = """Hello, welcome to BIG SPORTS CLI APP
                Whats your name? """

###################################

def welcome
    puts $greeting.colorize(:color => :light_blue)
    # puts "whats your name?"
    print "> "
    name = gets.chomp

    $user = User.create(name: name)
end

def display_options
    puts "You can say 'SEE MATCHES' to view all upcoming matches"
    puts "You can say 'FIND MATCHES' to find matches by team"
    puts "You can say 'MY FAVORITES' to view your favorites"
end

def user_input
    puts "What would you like to do?"
    print "> "
    answer = gets.chomp

    if answer == 'SEE MATCHES'
        Match.all.each do |match|
            ap "#{match.home_team} play #{match.away_team} at #{match.location}"
        end
        user_input()

    elsif answer == 'FIND MATCHES'
        puts "What team would you like to find?"
        print "> "
        team = gets.chomp 
        ap Match.sort_by_team(team)
        add_to_favorites()

    elsif answer == 'MY FAVORITES' 
        $user.matches.each do |match|
            ap "#{match.home_team} play #{match.away_team} at #{match.location}"
        end
        puts "Would you like to remove any favorites Y/N?"
        #TODO write out removal user input logic
        answer = gets.chomp
            if answer == "Y"
                #TODO delete logic
            elsif answer == 'N'
                user_input()
            else
                puts "Sorry, improper input."
                user_input()
            end
    else 
        puts "Sorry, improper input."
        user_input()
    end

end

def add_to_favorites
    puts "Would you like to add a match to your favorites? Y/N"
    answer = gets.chomp
        if answer == "Y"
            puts "Please select a match by ID"
            print "> "
            number = gets.chomp 
            Favorite.create(user_id: $user.id, match_id: number)
            puts "your favorites are now:"
             
            $user.matches.each do |match|
                ap "#{match.home_team} play #{match.away_team} at #{match.location}"
            end

            display_options()
            user_input()
        elsif answer == "N"
            display_options()
            user_input()
        else 
            puts "Sorry, improper input."
            user_input()
        end
end
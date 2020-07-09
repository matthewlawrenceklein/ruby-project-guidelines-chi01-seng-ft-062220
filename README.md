<div align="center">
  <img src="/matthewlawrenceklein/ruby-project-guidelines-chi01-seng-ft-062220/blob/Jacob/Images/N64%20SUPPER%20SOCCER%20BUDDY%2064.jpg?raw=true" alt="N64 SUPPER SOCCER BUDDY 64.jpg">
</div>


# Module One Final Project 

SOCCER BUDDY 64 CLI application
Using  CSV data with ruby’s built in capability for our Flatiron School Module One Project

Use our interactive application to create your account and keep track of your favorite teams in the English Premier League by adding them to your favorites. 

Sort through them by team or stadium so you know where and when your favorite teams play at all times!

Tagline: "Never miss a match on the English Premier League circuit, your one stop shop for every game in the series based on your favorite teams"


## Getting Started

Repository - https://github.com/matthewlawrenceklein/ruby-project-guidelines-chi01-seng-ft-062220

Run SOCCER BUDDY 64 CLI from your command line by entering:

ruby bin/run.rb

### Main Menu

The BIG SPORTS CLI main menu should pop up in your terminal!
Select an option from the main menu to proceed:

1. Create a new user 
2. Log in to an existing user using a unique user ID number.

### New Users

1. Enter your name.
2. You will be assigned a unique ID number.
3. This number will be used to log in as an existing user in the future.
4. After creating your account you will be taken into the Account  Menu.
5. See My Account menu in README for next steps.

### Existing Users

1. Enter your assigned ID number to access your account.
2. After logging in you will be taken into the Account Menu
3. See Account Menu in README for next steps.


### Account Menu

1. After logging in or creating a new account you will be taken into your account menu where you can choose from different options:
    a. Find Matches by Stadium
    b. Find Matches by Team
    c. My Favorites
    d. Exit
2. Find Matches by Stadium
    a. Use this search function to type in a stadium. 
        i. English Premier League Stadiums: 	
Amex Stadium, Falmer			          Emirates Stadium, London
Anfield, Liverpool				          Etihad Stadium, Manchester
Bramall Lane, Sheffield		          Goodison Park, Liverpool
Carrow Road, Norwich			          Molineux Stadium, Wolverhampton			
King Power Stadium, London			    Old Trafford, Manchester
Selhurst Park, London			          St. James’ Park Newcastle
St. Mary’s Stadium, Southampton	    Stamford Bridge, London
Tottenham Hotspur Stadium, London		Turf Moor, Burnley
Vicarage Road, Watford			        Villa Park, Birmingham
Vitality Stadium, Bournemouth
    b. After inputting a team the app will ask you if you want to add from these selections if YES then use the ID eg: 	"746 -- AFC Bournemouth play Southampton at Vitality Stadium, Bournemouth." 746 in this case to add to your favorites. 
    c. If No is selected the app will return you to the account menu.





3. Find Matches by Team
    a. Use this search function to type in your desired team.
        i. English Premier League Teams:
AFC Bournemouth				  Arsenal
Aston Villa					    Brighton and Hove Albion
Burnley					        Chelsea
Crystal Palace					Everton
Leicester City					Liverpool
Manchester City				  Manchester United
Newcastle United				Norwich City
Sheffield United				Southampton
Tottenham Hotspur				Watford
West Ham United				  Wolverhampton
    b.  After inputting a team the app will ask you if you want to add from these selections if YES then use the ID eg: 
    "737 -- Chelsea play Norwich City at Stamford Bridge, London." 737 in this case
    c. If No is selected the app will return you to the account menu.

4. My Favorites
    a. My Favorites option will take you into your account with 4 options.
        i.  Sort by home team
            * Displays your favorites in a list alphabetically by the home team.
        ii. Sort by stadium
            * Displays your favorites in a list alphabetically by the stadium.
        iii Remove favorite 
            * Input an ID to remove specific item from list.
        iv  Return to main menu
            *Return user to main menu.


### Project Background

Module One Project outline:

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate classes for your models and CLI interface.


## MVP and Stretch Goals

MVP:

1. Include a basic menu in the CLI with which the user can interact
2. Take users through multiple menus and functional options.
3. Users can navigate through matches based on stadium or team name and add to his or her list of favorites.
4. reating, Reading, Updating, and Deleting lists of favorites.
5. Exit option to close the program.
6. When logging back in data for User and Favorites persists. 

Stretch goals:

1. User validation, checking for existing users.
2. Adding style functionally to make seamless transitions between menus and adds to the interface experience. 

Gems used:

source "https://rubygems.org"
gem "activerecord", '~> 5.2'
gem "sinatra-activerecord"
gem "sqlite3", '~> 1.3.6'
gem "pry"
gem "require_all"
gem "faker"
gem 'rake'
gem 'awesome_print'
gem 'spreadsheet'
gem 'colorize'
gem 'csv'
gem 'tty-prompt'
gem 'tty-box'


## Authors

Mathew Klein - https://github.com/matthewlawrenceklein
Jacob Wazydrag - https://github.com/J-Waz
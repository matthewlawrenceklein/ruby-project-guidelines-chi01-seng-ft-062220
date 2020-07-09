require_relative '../config/environment'
ActiveRecord::Base.logger = nil

system('clear')

welcome()
display_options()
user_input()


# binding.pry
# puts "bork"

# puts "test"
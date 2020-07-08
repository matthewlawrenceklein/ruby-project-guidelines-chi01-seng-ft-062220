class Match < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    def self.sort_by_team(team_name)
        matches = Match.all.select { |match| match.home_team == team_name || match.away_team == team_name } 
        matches.each do |match|
            ap "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location}."
            # ap "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location} on #{match.date}, starting at #{match.start_time}"
        end
    end

    def self.sort_by_location(location)
        matches = Match.all.select { |match| match.location == location }
        matches.each do |match|
            ap "#{match.id} -- #{match.home_team} play #{match.away_team} at #{match.location}."
        end
    end

    # def self.sort_by_date(date)
    #     Match.all.select { |match| match.date == date}
    # end
end
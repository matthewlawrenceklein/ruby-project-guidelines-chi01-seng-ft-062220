class Match < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    def self.sort_by_team(team_name)
        Match.all.select { |match| match.home_team == team_name || match.away_team == team_name } 
    end

    def self.sort_by_location(location)
        Match.all.select { |match| match.location == location }
    end

    def self.sort_by_date(date)
        Match.all.select { |match| match.date == date}
    end
end
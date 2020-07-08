class User < ActiveRecord::Base
    has_many :favorites
    has_many :matches, through: :favorites

    ## user.favorites built-in method to show current favorites
    
    def find_by_team(team)
        self.matches.all.select { |match| match.home_team == team || match.away_team == team }
    end

    def find_by_location(location)
        self.matches.all.select { |match| match.location == location }
    end

    def find_by_date(date)
        self.matches.all.select { |match| match.date == date}
    end

    def remove_favorite(id)
       remove_me = self.favorites.find { |favorite| favorite.match_id == id}
       remove_me.destroy        
    end


end
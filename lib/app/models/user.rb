class User < ActiveRecord::Base
    has_many :favorites
    has_many :matches, through: :favorites

    ## user.favorites built-in method to show current favorites
    def add_match_to_favorites(id)
        Favorite.create(user_id: self.id, match_id: id)
    end
    
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
        Favorite.destroy(id)
    end


end
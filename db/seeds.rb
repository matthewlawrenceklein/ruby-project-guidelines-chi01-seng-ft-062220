
Match.destroy_all
User.destroy_all
Favorite.destroy_all


data = CSV.read("EPL_Fixturelist_1920.csv")
data.each do |row|
    Match.create(home_team: row[1], away_team: row[5], location: row[6], date: row[2])
end

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.string :location
      t.datetime :date
      # t.datetime :start_time
    end
  end
end

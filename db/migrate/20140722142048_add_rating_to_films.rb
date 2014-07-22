class AddRatingToFilms < ActiveRecord::Migration
  def change
    add_column :films, :ratings, :float
  end
end

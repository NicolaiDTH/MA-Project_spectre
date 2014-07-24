class AddActorsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :actors, :string
  end
end

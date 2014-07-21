class AddColumnsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :movie_id, :integer
    add_column :films, :poster_url, :string
    add_column :films, :actor_id, :string
  end
end

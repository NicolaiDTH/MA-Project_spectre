class AddStatusToFilms < ActiveRecord::Migration
  def change
    add_column :films, :status, :string
  end
end

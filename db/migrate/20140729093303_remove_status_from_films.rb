class RemoveStatusFromFilms < ActiveRecord::Migration
  def change
   remove_column :films, :status, :string
  end
end

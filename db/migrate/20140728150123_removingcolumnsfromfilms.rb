class Removingcolumnsfromfilms < ActiveRecord::Migration
  def change
   remove_column :films, :rating, :integer
   remove_column :films, :actor, :integer
   remove_column :films, :poster_url, :string
   remove_column :films, :actor_id, :string
  end
end

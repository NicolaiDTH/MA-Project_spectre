class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.integer :runtime
      t.integer :year
      t.integer :rating
      t.integer :votes
      t.string :poster
      t.integer :actor

      t.timestamps
    end
  end
end

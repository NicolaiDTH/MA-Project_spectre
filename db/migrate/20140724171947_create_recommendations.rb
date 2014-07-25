class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :title
      t.integer :runtime
      t.integer :year
      t.float :rating
      t.integer :votes
      t.string :poster
      t.string :actor

      t.timestamps
    end
  end
end

class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :status
      t.belongs_to :user, index: true
      t.belongs_to :films, index: true

      t.timestamps
    end
  end
end

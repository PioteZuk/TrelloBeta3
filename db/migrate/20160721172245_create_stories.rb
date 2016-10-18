class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :board_id, index: true
      t.integer :executor_id, index: true
      t.text :description
      t.string :title
      t.string :type
      t.timestamp
    end
  end
end

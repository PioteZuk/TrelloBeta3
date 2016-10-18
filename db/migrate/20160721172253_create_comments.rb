class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id, index: true
      t.integer :story_id, index:true
      t.integer :board_id, index:true
      t.text :content
      t.timestamp
    end
  end
end

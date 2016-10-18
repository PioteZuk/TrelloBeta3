class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :board_id
      t.timestamps 
    end
  #   add_index :members, [:user_id, :board_id], unique: true
  # end
end

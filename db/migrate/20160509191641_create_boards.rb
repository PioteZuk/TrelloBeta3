class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :owner_id, index: true
      t.string :title
      t.timestamps 
    end
  end
end

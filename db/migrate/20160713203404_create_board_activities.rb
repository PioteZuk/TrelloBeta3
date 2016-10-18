class CreateBoardActivities < ActiveRecord::Migration
  def change
    create_table :board_activities do |t|
      t.integer :user_id, index: true
      t.string :action, index: true
      t.integer :board_id, index: true
      t.integer :story_id, index: true
      t.integer :coment_id, index: true
      t.timestamps
    end
  end
end

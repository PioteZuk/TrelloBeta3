class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.string :email, index: true
    	t.string :token, index: true
    	t.boolean :active, default: true
        # jest aktywne zaproszenie czyli nie można wysłać kolejnego maila
    	t.boolean :accepted, default: false
        # jeszcze nie jest zaakceptowane po utworzeniu użydkownika zmiana na true
    	t.integer :board_id, index: true
    	t.timestamps
    end
  end
end

#         accepted  active  member 
#zielony    1         0       1
#czerwony    0        0       0
#czarny      0        1       0
#zapraszamy gościa który nie istnieje w bazie - czarny
#zapraszamy gościa który istnieje w bazie - czarny
#* odrzucił - czerwony
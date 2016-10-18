class Member < ActiveRecord::Base
	belongs_to :user, inverse_of: :members
	belongs_to :board, inverse_of: :members

end


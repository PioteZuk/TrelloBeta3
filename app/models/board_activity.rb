class BoardActivity < ActiveRecord::Base

  belongs_to :board
  belongs_to :user

  def self.generate(object, current_user, action)
    action_type = [object.class.to_s.downcase, action].join(':')
    create(board: object.find_board, user: current_user, action: action_type)
  end

end

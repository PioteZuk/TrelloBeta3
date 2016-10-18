class Board < ActiveRecord::Base
	has_many :members, dependent: :destroy #przy usuwaniu boarda usuwa membersow
	has_many :users, through: :members
	has_many :invitations, dependent: :destroy
  has_many :board_activities, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
	belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

	scope :own, ->(current_user) { where(owner: current_user)}

	validates :title, presence: true

  def find_board
    self
  end

end

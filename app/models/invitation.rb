class Invitation < ActiveRecord::Base
	belongs_to :board
	belongs_to :user, foreign_key: :email

  scope :invitated, -> {where(accepted: false, active: true)}
  scope :rejected, -> {where(accepted: false, active: false)}
end

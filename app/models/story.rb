class Story < ActiveRecord::Base
  TYPES = %w(Story::Base Story::Bug Story::Improvment)
  belongs_to :executor, class_name: 'User', foreign_key: 'executor_id'
  belongs_to :board
  has_many :comments

end

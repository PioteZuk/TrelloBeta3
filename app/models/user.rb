class User < ActiveRecord::Base
	has_many :members
  has_many :board_activities, dependent: :destroy
	has_many :boards, through: :members
  has_many :board_stories
  has_many :stories_coments
	has_many :invitations, primary_key: :email, foreign_key: :email # zrobić wyszukiwanie po emailu
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end

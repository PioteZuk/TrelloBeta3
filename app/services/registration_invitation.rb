class RegistrationInvitation 

	def initialize(token, user)
		@token = token
		@user = user
	end

	def self.call(token, user)
		new(token, user).call
	end

	def call
		return unless valid_invitation?
        ActiveRecord::Base.transaction do
  			invitation.update!(active: false, accepted: true)
        	@user.members.create!(board_id: invitation.board_id)
		end
	end

	private

	def invitation
		@invitation ||= Invitation.find_by(token: @token)
	end

	def valid_invitation?
		invitation.present? && invitation.active?
	end

end
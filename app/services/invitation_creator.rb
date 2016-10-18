class InvitationCreator
	def initialize(board, params)
		@board = board
		@params = params
	end

	def self.create(board, params)
		new(board, params).create
	end

	def create
		invitation.token = SecureRandom.base64
		invitation.save && send_invitation
	end

	private

	def invitation
		@invitation ||= @board.invitations.new(@params)
	end

	def user_exists?
		User.find_by(email: @params[:email]).present?
	end

	def send_invitation
		type = user_exists? ? :exists : :new
		InvitationMailer.call(invitation, type).deliver
	end
end
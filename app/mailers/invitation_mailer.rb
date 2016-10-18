class InvitationMailer < ActionMailer::Base
	default from:'zuk.piotrr@gmail.com'

	def call(invitation, type)
		@token = invitation.token
		@email = invitation.email
		@invitation = invitation
		@url = control_panel_invitation_submit_url(@invitation)
		mail(to:@email, subject: I18n.t("mailers.subjects.#{type}")) do |format|
			format.html { render type }
		end
	end
end
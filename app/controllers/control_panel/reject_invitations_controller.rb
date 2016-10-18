class ControlPanel::RejectInvitationsController < ControlPanel::ControlPanelController

	def update
	    invitation.update(accepted: false, active: false)
	    redirect_to control_panel_board_invitations_path(invitation)
	end

	private

	def invitation
		@invitation ||= current_user.invitations.find(params[:invitation_id])
	end
end
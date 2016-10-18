class ControlPanel::SubmitInvitationsController < ControlPanel::ControlPanelController

	def update
	    invitation.update(accepted: true, active: false)
	    current_user.members.create!(board_id: invitation.board_id)
	    redirect_to control_panel_board_path(invitation.board)	
	end

	private

	def invitation
		@invitation ||= current_user.invitations.find(params[:invitation_id])
	end
end
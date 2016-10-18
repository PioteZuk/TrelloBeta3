class ControlPanel::InvitationsController < ControlPanel::ControlPanelController
	def index
		#dodać widok z akcjami
		@invitations = current_user.invitations
	end

	def create
		if invitation_exists?
			redirect_to control_panel_board_path(board), alert: 'you can not send invitation on this email twice'
		else
			InvitationCreator.create(board, invitation_params)
			redirect_to control_panel_board_path(board), notice: 'invitation was sent'
		end
	end

	private

	def board
		@board ||= Board.find(params[:board_id])
	end

	def invitation_exists?
		board.invitations.find_by(email: invitation_params[:email]).present?
	end

	def invitation_params
		params.require(:invitation).permit(:email)
	end
end

#castomowe walidacje w modelu na to co w create
# hidenfilda(token) do formularza rejestracyjnego w registration controlerze na cereate
# i podłaczyć do tej tablicy zmieniam invitation na false
			#sprawdzić czy mail jest użyty do jakiegość usera active na false,
			#zmiana accepted na true po zaakceptowaniu

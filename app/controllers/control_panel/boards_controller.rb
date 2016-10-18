class ControlPanel::BoardsController < ControlPanel::ControlPanelController
	before_action :find_board, only:[:edit, :update, :destroy, :show]


	def index
		@boards = current_user.boards.own(current_user)
		@boards_as_member = current_user.boards.where.not(owner: current_user)
	end

	def new
		@board = Board.new(owner: current_user)
	end

	def create
		creator = BoardCreator.new(params, current_user)
		if creator.save
			redirect_to control_panel_boards_path, notice: 'Board was successful added'
		else
			@board = creator.board
			render :new
		end
	end

	def edit
	end

	def update
		if @board.update_attributes(board_params)
			redirect_to control_panel_boards_path, notice: 'Board was succesful changed'
		else
			render :edit
		end
	end

	def destroy
		if (@board.owner == current_user) && @board.destroy
			redirect_to control_panel_boards_path, notice: 'Board was successful deleted'
		else
			redirect_to control_panel_boards_path, alert: 'Only owner can delete board'
		end
	end

	def show

	end

	private

	def board_params
		params.require(:board).permit(:title)
	end

	def find_board
		@board = Board.find(params[:id])
	end


end

class BoardCreator

  def initialize(params, current_user)
    @params = params
    @user = current_user
  end

  def save
    return false unless board.save
    board.members.create(user: @user)
    BoardActivity.generate(board, @user, @params[:action])
    true
  end

  def board
    @board ||= Board.new(board_params)
  end

  private

  def board_params
    @params.require(:board).permit(:title).merge!(owner: @user)
  end
end

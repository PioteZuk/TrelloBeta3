class ControlPanel::CommentsController < ControlPanel::ControlPanelController
  before_action :find_comment,:find_story, only:[:edit, :update, :destroy]
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.new(comment_params)
    if @comment.save
      redirect_to edit_control_panel_board_story_path(@story.board, @story), notice: "OK"
    else
      redirect_to edit_control_panel_board_story_path(@story.board, @story), alert: "error"
    end
  end

  def edit

  end

  def update
    @comment.update_attributes(comment_params)
    redirect_to edit_control_panel_board_story_path(@story.board, @story), notice: "OK"
  end

  def destroy
    @comment.destroy
    redirect_to edit_control_panel_board_story_path(@story.board, @story), notice: "OK"
  end

  private

  def find_story
    @story = Story.find(params[:story_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

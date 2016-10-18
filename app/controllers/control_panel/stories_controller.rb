class ControlPanel::StoriesController < ControlPanel::ControlPanelController
  before_action :find_story, only:[:edit, :update, :destroy]
  def create
    @story = board.stories.create
    redirect_to edit_control_panel_board_story_path(board, @story)
  end

  def edit
    board
    #render na podstawie nazwy story łapie widok który znajduje się we views/stories/edit
  end

  def update
    @story.update_attributes(story_params)
    redirect_to control_panel_board_path(board), notice: 'story was successful updated'
  end

  def destroy
    find_story.destroy
    redirect_to control_panel_board_path(board), notice: 'story was successful deleted'
  end

  private

  def board
    @board ||= Board.find(params[:board_id])
  end

  def find_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :description, :executor_id, :type)
  end

end

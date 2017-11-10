class CommentsController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @comments = @game.comments
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end

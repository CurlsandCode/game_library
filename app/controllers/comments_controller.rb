class CommentsController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @comments = @game.comments
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @comments.to_json}
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end

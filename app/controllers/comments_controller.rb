class CommentsController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @comments = @game.comments
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @comments.to_json}
    end
  end

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comments_params)
    if @comment.save
      respond_to do |format|
        format.html {render :show}
        format.json {render json: @comment.to_json}
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end

class ScreenshotsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.screenshots.build(screenshots_params)
    if @game.save
      flash[:notice] = "Game not created."
      redirect_to game_path(@game)
    else
      flash[:alert] = "Screenshot not saved."
      redirect_to game_path(@game)
    end
  end

  private

  def screenshots_params
    params.require(:screenshot).permit(:caption, :picture)
  end
end

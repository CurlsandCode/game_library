class ScreenshotsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.screenshots.build(screenshots_params)
    if @game.save
      flash[:notice] = "Sreenshot saved!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Screenshot not saved."
      redirect_to game_path(@game)
    end
  end

  def show
    @screenshot = Screenshot.find(params[:id])
  end

  private

  def screenshots_params
    params.require(:screenshot).permit(:caption, :picture)
  end
end

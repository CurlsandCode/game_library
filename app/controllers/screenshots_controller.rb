class ScreenshotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @screenshot.to_json}
    end
  end

  def destroy
    @screenshot = Screenshot.find(params[:id])
    @screenshot.destroy
    flash[:notice] = "Screenshot successfully deleted"
    redirect_to user_path(current_user)
  end

  private

  def screenshots_params
    params.require(:screenshot).permit(:caption, :picture)
  end
end

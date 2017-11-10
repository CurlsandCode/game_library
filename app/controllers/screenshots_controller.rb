class ScreenshotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def create
    @game = Game.find(params[:game_id])
    @screenshot = @game.screenshots.build(screenshots_params)
    if @screenshot.save
      flash[:notice] = "Sreenshot saved!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Screenshot not saved."
      redirect_to game_path(@game)
    end
  end

  def index
    game = Game.find(params[:game_id])
    @screenshots = game.screenshots
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @screenshots.to_json(:methods => :avatar_url)}
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
    @game = Game.find(params[:game_id])
    @screenshot.destroy
    flash[:notice] = "Screenshot successfully deleted"
    redirect_to game_path(@game)
  end

  private

  def screenshots_params
    params.require(:screenshot).permit(:caption, :picture)
  end
end

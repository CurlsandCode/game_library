class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def user_completed
    @games = current_user.games.completed_games
  end

  def screenshots
    @screenshots = current_user.screenshots
    respond_to do |format|
      format.html {render :screenshots}
      format.json {render json: @screenshots.to_json(:methods => :avatar_url)}
    end
  end


end

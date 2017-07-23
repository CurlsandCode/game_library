class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def user_completed
    @games = current_user.games.completed_games
  end


end

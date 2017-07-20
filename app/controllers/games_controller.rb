class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    binding.pry
    @game = current_user.games.build(game_params)
    if @game.save
      flash[:notice] = "Game successfully created!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Game not saved."
      flash[:alert] = "Game not created."
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    if @game.update(game_params)
      flash[:alert] = "Game successfully updated."
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :rating, :completed, :notes)
  end
end

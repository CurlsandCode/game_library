class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
  end

  def show
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :rating, :completed, :notes)
  end
end

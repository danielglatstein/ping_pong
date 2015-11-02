class GamesController < ApplicationController 

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create
  end

  def show
    @game = Game.find
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:match_time, :table_id, :player_ids => [])
  end

end
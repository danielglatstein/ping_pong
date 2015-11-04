class GamesController < ApplicationController 

  

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    date = Time.now
    game = Game.create(match_time: date)
    team1_player_ids = [params[:game][:team1][0][:player_ids].to_i, params[:game][:team1][1][:player_ids].to_i]
    team2_player_ids = [params[:game][:team2][0][:player_ids].to_i, params[:game][:team2][1][:player_ids].to_i]
    team1 = Team.find_or_create_by_player_ids(team1_player_ids)
    team2 = Team.find_or_create_by_player_ids(team2_player_ids)
    team_game_one = TeamGame.create(team_id: team1.id, game_id: game.id)
    team_game_two = TeamGame.create(team_id: team2.id, game_id: game.id)
    team_game_one.update(score: params[:game][:team1][1][:team_games][:score])
    team_game_two.update(score: params[:game][:team2][1][:team_games][:score])
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:match_time, :table_id, :teams_attributes => [], :team_games => [], :player_ids => [])
  end

end
class TeamsController < ApplicationController 

  def index
    @teams = Team.all
  end

  def new
  end

  def create
  end

  def show
    @team = set_team
    @games = @team.games
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
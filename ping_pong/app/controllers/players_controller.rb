class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
   
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      session[:player_id] = @player.id
      redirect_to new_game_path, :notice => "Ping Pong Rally On!"
    else
      render :new
    end
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :email, :password, :password_confirmation)
    end
end
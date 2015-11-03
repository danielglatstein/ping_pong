class SessionsController < ApplicationController 

  def create
    player = Player.find_by_email(params[:email])
    if player && player.authenticate(params[:password])
      log_in player
      remember player
      redirect_to players_path, :notice => "Hello, #{player.name}!"
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, :notice => "Logged out!"
  end

end
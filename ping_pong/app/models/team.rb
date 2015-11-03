# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "pry"

class Team < ActiveRecord::Base
  has_many :team_games
  has_many :games, through: :team_games
  has_many :team_players
  has_many :players, through: :team_players

  def self.find_or_create_by_player_ids(player_id_array)
    player1_id = player_id_array[0]
    player2_id = player_id_array[1]
    team = TeamPlayer.select("team_players.*").where("team_players.player_id = 1 OR team_players.player_id = 2")
    #iterate thru team and find the ones that have == team_players.team_id

    # Team.find_or_create_by_player_ids([1, 2]) Yields this sql statement: 
    #SELECT * FROM teams INNER JOIN team_players 
    #ON team_players.team_id= teams.id 
    #WHERE team_players.player_id = 1 as first, 
    #team_players.player_id = 2 as second, 
    #and first.team_id = second.team_id

    player1_team_players = TeamPlayer.all.select do |team_player|
      team_player.player_id == player1_id
    end

    player2_team_players = TeamPlayer.all.select do |team_player|
      team_player.player_id == player2_id
    end

    results = player1_team_players.map do |player1_team_player|
      player2_team_players.find do |player2_team_player|
        player1_team_player.team_id == player2_team_player.team_id
      end
    end.compact.flatten
    if results != []
      new_team = results[0].team
      new_team.save
    else
      new_team = Team.create
      new_team.player_ids = player_id_array
      new_team.save
    end
      new_team
  end

end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

    if team
      team
    else
      new_team = Team.create
      new_team.player_ids = player_id_array
      new_team.save
      new_team
    end
  end

end

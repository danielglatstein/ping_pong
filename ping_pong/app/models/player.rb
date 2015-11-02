# == Schema Information
#
# Table name: players
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Player < ActiveRecord::Base
  has_many :team_players
  has_many :teams, through: :team_players
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  # has_secure_password

  def teams
    select from teams.* all games where player_1_id == self.id
    # all games for self = player1_games + player2_games 
    # [return should be a collection of instances where self is player1 and player2]
  end

  def games
    #[return collection of all games self's teams were involved in]
  end

  def wins_single
    single_games.select do |game|
       game == win
    end
  end

  def losses_single
  end

  def single_games
  end

  def doubles_games
  end
end
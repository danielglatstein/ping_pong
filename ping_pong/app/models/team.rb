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
end

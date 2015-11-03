# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  match_time :datetime
#  table_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  has_many :team_games
  has_many :teams, through: :team_games
  belongs_to :table
  accepts_nested_attributes_for :teams
  accepts_nested_attributes_for :team_games
  
  def team_one
    self.team_games.first.team
  end

  def team_one_score
    self.team_games.first.score
  end

  def team_two
    self.team_games.last.team
  end

  def team_two_score
    self.team_games.last.score
  end

  def winning_team
    if team_one_score > team_two_score
      team_one
    else
      team_two
    end
  end

  def losing_team
    if team_one_score > team_two_score
      team_two
    else
      team_one
    end
  end

end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  player1_id :integer
#  player2_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"
  has_many :side_a_games, class_name: "Game", foreign_key: "team_a_id"
  has_many :side_b_games, class_name: "Game", foreign_key: "team_b_id"
  validates_presence_of :player1
end

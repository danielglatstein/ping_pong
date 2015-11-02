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
end

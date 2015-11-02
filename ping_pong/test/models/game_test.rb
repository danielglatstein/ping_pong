# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  team_a_id     :integer
#  team_b_id     :integer
#  team_a_points :integer
#  team_b_points :integer
#  match_time    :datetime
#  table_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

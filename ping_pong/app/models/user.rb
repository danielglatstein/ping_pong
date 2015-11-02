# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :player1_teams, class_name: "Team", foreign_key: "player1_id"
  has_many :player2_teams, class_name: "Team", foreign_key: "player2_id"
  has_many :games, through: :teams
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  has_secure_password
end

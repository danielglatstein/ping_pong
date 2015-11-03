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
  has_secure_password

  attr_accessor :remember_token

end

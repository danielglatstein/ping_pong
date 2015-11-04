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
  # has_many :team_players
  # has_many :teams, through: :team_players
  has_and_belongs_to_many :teams
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  # has_secure_password

  attr_accessor :remember_token

      def singles_team
        Team.find_or_create_by_player_ids([self.id, 0])
      end

      def singles_games
        singles_team.games
      end

      def singles_games_total
        singles_games.count
      end

      def singles_wins
        singles_games.select do |game|
          game.winning_team == singles_team
        end.count
      end

      def singles_wins
        singles_games.select do |game|
          game.losing_team == singles_team
        end.count
      end

      def doubles_teams
        singles_team
        self.teams - [singles_team]
      end

      def doubles_games
        doubles_teams.map do |team|
          team.games
        end.compact.flatten
      end

      def doubles_games_total
        doubles_games.count
      end

      def games_total
        singles_games_total + doubles_games_total
      end

      def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end

      def self.new_token
        SecureRandom.urlsafe_base64
      end

      def remember
        self.remember_token = Player.new_token
        update_attribute(:remember_digest, Player.digest(remember_token))
      end

      def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end

     def forget
        update_attribute(:remember_digest, nil)
     end

end

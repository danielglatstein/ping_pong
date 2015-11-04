  Table.delete_all
  Player.delete_all
  Game.delete_all

  Table.create(
    name: "Hopper"
  )


  Table.create(
    name: "On Top of the Freedom Tower"
  )

  Table.create(
    name: "Bottom of the Gowanus Canal"
  )

  100.times do  
    Player.create(
      name: Faker::Name.name, 
      email: Faker::Internet.email
    )
  end

    sample1 = (1..50).to_a
    sample2 = (51..100).to_a
    sample3 = (1..25).to_a
    sample4 = (26..50).to_a

  25.times do 
    Game.new.tap do |game|

      game.match_time = Faker::Date.between(4.weeks.ago, Date.today)
      game.table_id = rand(1..3)

      team1_first_player = sample1.pop
      team1_second_player = sample2.pop
      team2_first_player = sample1.pop
      team2_second_player = sample2.pop

      team1 = game.teams.build
      team2 = game.teams.build

      team1.player_ids = [team1_first_player, team1_second_player]
      team2.player_ids = [team2_first_player, team2_second_player]

      game.save

      # game.team_games.first.score = rand(1..21)

      # game.team_games.last.score = rand(1..21)

      # game.save
      # game.team_games.each(&:save)
    end
  end

    25.times do 
      Game.new.tap do |game|

        game.match_time = Faker::Date.between(4.weeks.ago, Date.today)
        game.table_id = rand(1..3)

        team1_first_player = sample3.pop

        team2_first_player = sample4.pop


        team1 = game.teams.build
        team2 = game.teams.build

        team1.player_ids = [team1_first_player]
        team2.player_ids = [team2_first_player]

        game.save
        
        # game.team_games.first.score = rand(1..21)
        # game.team_games.last.score = rand(1..21)

        # game.save
        # game.team_games.each(&:save)
      end
    end

    TeamGame.all.each do |team_game|
      team_game.score = rand(1..21)
      team_game.save
    end



class ListGames
    def initialize(game_list)
      @game_list = game_list
    end
  
    def list_games
      puts "GAME LIST:\n"
      @game_list.each_with_index do |game, index|
        puts "Game #{index + 1}.
        Name: #{game.label.title}
        Genre: #{game.genre.name}
        Creator: #{game.author.first_name} #{game.author.last_name}
        Last Played: #{game.last_played_at}
        Multiplayer: #{game.multiplayer ? 'YES' : 'NO'}\n"
      end
      puts "\n"
    end
  end
require './options'

class App
  include Options
  def run
    display_options
  end

  def load_saved_games
    # load the saved games
  end
end

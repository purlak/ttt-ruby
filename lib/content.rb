module Content
  def self.welcome
    'Welcome to Tic Tac Toe!'
  end

  def self.select_marker
    "Choose 'X' or 'O' to play game:"
  end

  def self.menu
    "Select your game:\n" \
      "1. Human v. Human\n" \
      '2. Human v. Ai'\
  end
end

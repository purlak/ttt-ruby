module Content
  def self.welcome
    'Welcome to Tic Tac Toe!'
  end

  def self.menu(num)
    "Select Player#{num}:\n" \
    "1. Human\n" \
    '2. Ai'\
  end
end

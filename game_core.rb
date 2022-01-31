module GameCore
  include MessageSystem

  def start_game
    loop do
      break if hands_full?
      choise = gets.chomp.to_sym
      break if choise == :open
      user_turn(choise)
      dealer_turn
    end
    cards_out
  rescue StandardError => e
    puts e.message
    retry
  end

  def hands_full?
    full = self.players.map { |p| p.hand.cards.length == MAX_CARDS }
    full[0] && full[1]
  end

  def user_turn(choise)
    @user.add(self.deck) if choise == :add
  end

  def dealer_turn
    return if self.players[0].hand.cards.length == MAX_CARDS
    self.players[0].add(self.deck) if self.players[0].hand.sum < 17
  end

  def cards_out    
    #self.players.each {}
  end
end
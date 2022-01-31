module GameCore
  MAX_CARDS = 3

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
    puts @dealer.hand.cards.length
    @dealer.hand.cards.length == MAX_CARDS && @user.hand.cards.length == MAX_CARDS
  end

  def user_turn(choise)
    @user.add(self.deck) if choise == :add
  end

  def dealer_turn
    return if @dealer.hand.cards.length == MAX_CARDS
    @dealer.add(self.deck) if @dealer.hand.sum < 17
  end

  def cards_out; end
end
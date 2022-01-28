module GameCore
  MAX_CARDS = 3

  def start_game
    loop do
      break if hands_full? || !user_turn?
      dealer_turn
    end
    cards_out
  end

  def hands_full?
    @dealer.hand.cards.length == MAX_CARDS
  end

  def user_turn?
    choise = gets.chomp.to_sym
    return false if choise == :open
    return true if choise == :pass

    @user.add(@deck)
  end

  def dealer_turn; end
  def cards_out; end
end
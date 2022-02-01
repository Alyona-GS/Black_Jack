module GameCore
  include MessageSystem,
          CountSystem

  private

  def start_game
    loop do
      self.players.reverse_each(&:print_cards)
      print "Action: "
      choise = gets.chomp.to_sym
      raise EXCEPT[:no_action] unless [:open, :pass, :add].include?(choise)

      break                            if choise == :open
      self.players.last.add(self.deck) if choise == :add

      dealer_turn
      break if hands_full?
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def hands_full?
    full = self.players.map { |p| p.hand.cards.length == MAX_CARDS }
    full.first && full.last
  end

  def dealer_turn
    dealer = self.players.first
    return if dealer.hand.cards.length == MAX_CARDS
    dealer.add(self.deck) if dealer.hand.sum < 17
  end
end
module GameCore
  include MessageSystem

  private

  def start_game
    self.players.reverse_each(&:print_cards)
    loop do
      print "Action: "
      choise = gets.chomp.to_sym
      raise EXCEPT[:no_action] unless [:open, :pass, :add].include?(choise)

      break                            if choise == :open
      self.players.last.add(self.deck) if choise == :add

      dealer_turn
      self.players.reverse_each(&:print_cards)
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
    puts "Dealer turn!"
    dealer = self.players.first
    return if dealer.hand.cards.length == MAX_CARDS

    dealer.add(self.deck) if dealer.hand.sum < 17
  end
end
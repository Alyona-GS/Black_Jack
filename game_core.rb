module GameCore
  include MessageSystem

  def start_game
    self.players.each { |p| p.deal(self.deck) }
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
    full.first && full[1]
  end

  def user_turn(choise)
    self.players[1].add(self.deck) if choise == :add
  end

  def dealer_turn
    return if self.players.first.hand.cards.length == MAX_CARDS
    self.players.first.add(self.deck) if self.players.first.hand.sum < 17
  end

  def cards_out    
    scores = self.players.map { |p| p.hand.sum }
    best_score = scores.compact.max
    if scores.count(best_score) > 1
      puts "Draw!"
      self.players.each { |p| p.money += BET }
      return
    end
    winner = players[scores.index(best_score)]
    winner.money += BET * self.players.length
    puts "Winner: #{winner.name}"
  end
end
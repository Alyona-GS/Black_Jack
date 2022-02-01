module CountSystem
  include MessageSystem
  
  private

  def count_points  
    cards_out  
    scores     = self.players.map { |player| player.hand.sum }
    best_score = scores.reject { |sum| sum > MAX_SCORE }.max
    scores.count(best_score) > 1 ? draw : winner(scores, best_score)
  end

  def draw
    puts "Draw!"
    self.players.each { |player| player.money += BET }
  end

  def winner(scores, best_score)
    winner = players[scores.index(best_score)]
    winner.money += BET * self.players.length
    puts "Winner: #{winner.name}"
  end

  def cards_out
    puts "CARDS OUT!"
    self.players.last.print_cards
    self.players.first.print_open_cards
  end
end
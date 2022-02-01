class Dealer < Player
  def initialize
    super(:dealer)
  end

  def print_cards
    print " | DEALER CARDS: "
    self.hand.cards.length.times { print "*" }
    print "\n"
  end

  def print_open_cards
    print " | DEALER CARDS: "
    self.hand.output
    puts "sum #{self.hand.sum}"
  end
end
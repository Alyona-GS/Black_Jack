class Dealer < Player
  def initialize
    super(:dealer)
  end

  def print_cards
    puts " | DEALER CARDS: **"
  end

  def print_open_cards
    print " | DEALER CARDS: "
    self.hand.output
    puts "sum #{self.hand.sum}"
  end
end
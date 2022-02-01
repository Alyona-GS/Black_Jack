class User < Player

  def add(deck)
    raise EXCEPT[:limit] if self.hand.cards.length == 3
    super(deck)
  end

  def print_cards
    puts "-----------------------------"
    print "YOUR CARDS:  "
    super()
  end
end
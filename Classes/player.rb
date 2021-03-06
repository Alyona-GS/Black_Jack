class Player
  include MessageSystem

  attr_accessor :money
  attr_reader   :name, :hand

  def initialize(name)
    @name = name
    @money = INIT_MONEY
  end

  def deal(deck)
    @money -= BET
    @hand = Hand.new(deck)
  end

  def add(deck)
    @hand.cards << Card.new(deck)
  end

  def print_cards
    self.hand.output
    print "sum #{self.hand.sum}"
  end
end
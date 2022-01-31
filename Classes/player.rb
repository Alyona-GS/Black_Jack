class Player
  include MessageSystem

  attr_reader :hand

  def initialize
    @money = INIT_MONEY
  end

  def deal(deck)
    @money -= BET
    @hand = Hand.new(deck)
  end

  def add(deck)
    @hand.cards << Card.new(deck).value
  end
end
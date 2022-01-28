class Player
  INIT_MONEY = 100
  BET = 10

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
    deck.delete_at(card_index)
  end
end
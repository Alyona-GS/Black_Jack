class Hand
  INIT_CARDS = 2

  attr_reader :cards

  def initialize(deal)
    @cards = INIT_CARDS.times.map{ Card.new(deal) }
  end

  def sum(hand); end
end
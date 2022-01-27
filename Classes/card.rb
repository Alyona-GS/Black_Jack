class Card
  attr_reader :value

  def initialize(deck)
    card_number = rand(deck.cards.length)
    @value = deck.cards[card_number - 1]
  end
end
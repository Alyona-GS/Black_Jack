class Card
  attr_reader :value

  def initialize(deck)
    card_index = rand(deck.cards.length) - 1
    @value = deck.cards[card_index].chr
    deck.cards.delete_at(card_index)
  end
end
require_relative 'all_required'

class BlackJack
  include GameCore

  attr_accessor :deck
  attr_reader   :players

  def initialize
    @players = [Dealer.new, User.new]
  end

  def start
    loop do
      @deck = Deck.new
      deal_cards(deck)
      start_game
      return unless answer?
    end
  end

  def deal_cards(deck)
    self.players.each { |p| p.deal(deck) }
  end

  def answer?
    false;
  end
end

black_jack = BlackJack.new
black_jack.start
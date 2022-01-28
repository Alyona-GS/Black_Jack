require_relative 'all_required'

class BlackJack
  include GameCore

  attr_accessor :deck

  def initialize
    @user = User.new
    @dealer = Dealer.new
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
    ObjectSpace.each_object(Player) { |p| p.deal(deck) }
  end

  def answer?
    false;
  end
end

black_jack = BlackJack.new
black_jack.start
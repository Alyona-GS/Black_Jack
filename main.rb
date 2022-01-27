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
      deal_cards
      start_game
      return unless answer?
    end
  end

  def deal_cards
    ObjectSpace.each_object(Player) { |p| p.deal(self.deck) }
  end

  def answer?
    false;
  end
end

black_jack = BlackJack.new
black_jack.start
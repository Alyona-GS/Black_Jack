class BlackJack
  include GameCore,
          MessageSystem

  attr_accessor :deck
  attr_reader   :players

  def initialize(name)
    @players = [Dealer.new, User.new(name)]
  end

  def start
    loop do
      raise EXCEPT[:no_money]      if self.players.last.money.zero?
      raise EXCEPT[:deal_no_money] if self.players.first.money.zero?

      @deck = Deck.new      
      start_game
      return unless continue?
    end
  rescue StandardError => e
    puts e.message
  end

  def continue?
    mess_continue(self.players.last)
    gets.chomp == "y"
  end
end
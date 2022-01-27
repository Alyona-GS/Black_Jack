class Deck
  attr_reader :cards

  def initialize
    @cards = []
    suits = ["♥", "♦", "♣", "♠"]
    pictures = ["J", "Q", "K", "A"]
    9.times { |i| suits.each { |s| cards << "#{i + 2}#{s}" } }
    pictures.each { |p| suits.each { |s| cards << "#{p}#{s}" } }
  end

  def delete_card; end
end
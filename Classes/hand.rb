class Hand
  include MessageSystem

  attr_reader :cards

  def initialize(deck)
    @cards = INIT_CARDS.times.map{ Card.new(deck).value }
    summarize
  end

  def summarize
    pict_sum = count(["J", "Q", "K"]) * PICT_VALUE
    sum = numb_sum + pict_sum
    aces_sum.add(sum).reject { |sum| sum > 21 }.max # check nil
  end

  private

  def aces_sum
    aces = count("A")
    (0..aces).to_a.map { |i| i * BIG_ACE + (aces - i) }
  end

  def numb_sum
    self.cards.select(&:is_integer?).map(&:to_i).sum
  end

  def count(values)
    self.cards.select { |card| values.include?(card) }.count
  end
end

class String
  def is_integer?
    self == self.to_i.to_s
  end
end

class Array
  def add(value)
    self.map { |element| element + value }
  end
end
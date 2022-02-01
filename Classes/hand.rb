class Hand
  include MessageSystem

  attr_reader :cards

  def initialize(deck)
    @cards = INIT_CARDS.times.map{ Card.new(deck) }
  end

  def sum
    numb_sum = find('2'..'10').map(&:to_i).sum
    pict_sum = find(["J", "Q", "K"]).count * PICT_VALUE
    sum      = numb_sum + pict_sum

    sum_arr  = aces_sum.add(sum)
    return sum_arr.min if sum_arr.min > MAX_SCORE

    sum_arr.select { |sum| sum <= MAX_SCORE }.max
  end

  def output
    self.cards.each { |card| print "#{card.value} " }
  end

  private

  def aces_sum
    aces = find("A").count
    (0..aces).to_a.map { |i| i * BIG_ACE + (aces - i) }
  end

  def find(arr)
    values = self.cards.map { |card| card.value.chop }
    values.select { |value| arr.include?(value) }
  end
end

class Array
  def add(value)
    self.map { |element| element + value }
  end
end
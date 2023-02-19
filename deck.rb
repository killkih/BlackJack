class Deck
  attr_reader :cards

  def initialize
    @suits = ['♠', '♥', '♣', '♦']
    @cards_values = %w[2 3 4 5 6 7 9 10 J Q K T]
  end

  def drop_card
    card = cards.sample
    cards.delete(card)
  end

  def refresh
    @cards = []
    @cards_values.each { |card| @suits.each { |suit| cards << card + suit } }
  end
end

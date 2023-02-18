class Deck
  attr_reader :deck

  def initialize
    @suits = ['♠', '♥', '♣', '♦']
    @cards = %w[2 3 4 5 6 7 9 10 J Q K T]
  end

  def drop_card
    card = @deck.sample
    @deck.delete(card)
  end

  def refresh
    @deck = []
    @cards.each { |card| @suits.each { |suit| @deck << card + suit } }
  end
end

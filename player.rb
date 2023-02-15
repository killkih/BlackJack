require_relative 'deck'
class Player
  attr_reader :name, :cards

  def initialize(name = nil)
    @name = name
    @cards = []
  end

  def take_card(deck)
    @cards << deck.drop_card
  end

end

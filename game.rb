require_relative 'player'
class Game
attr_reader :player, :diller, :deck
  def initialize(player, diller, deck)
    @player = player
    @diller = diller
    @deck = deck
  end

  def start
    2.times do
      @player.take_card(deck)
      @diller.take_card(deck)
    end
  end

  def show_cards
    puts @player.cards
  end


end

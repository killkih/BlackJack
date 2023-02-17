require_relative 'player'
class Game
attr_accessor :bank
attr_reader :player, :dealer, :deck

  def initialize(player, deck)
    @player = player
    @dealer = Player.new('Dealer')
    @players = [@player, @dealer]
    @deck = deck
    @bank = 0
  end

  def start
    deck.refresh

    @players.each do |player|
      player.clear
      player.bet
      2.times { add_card(player) }
    end

    self.bank = 20
  end

  def add_card?
    add_card(@dealer) if @dealer.count_points < 17
  end

  def add_card(player)
    player.take_card(deck) if player.cards.size < 3
  end

  def next_game
    deck.refresh
    start
  end

  def who_won?
    @winner = nil
    if player.count_points > dealer.count_points && player.count_points < 22
      player.money += bank
      winner = player.name
    elsif player.count_points < dealer.count_points && dealer.count_points < 22
      dealer.money += bank
      @winner = player.name
    else
      @players.each { |player| player.money += 10 }
    end

  end

  def end_game
    puts "Карты дилера: #{@dealer.cards}"
    puts "Сумма очков дилера: #{@dealer.points}"

    if @winner == nil
      puts "Ничья!"
    else
      puts "Победил - #{@winner}!"
    end
  end

end

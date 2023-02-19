class Game
  attr_accessor :bank
  attr_reader :player, :dealer, :deck

  MAX_POINTS = 21
  MAX_DEALER_POINTS = 17
  MAX_NUMBER_OF_CARDS = 3

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

  def show_stats
    puts "Ваши карты: #{@player.cards}"
    puts "Ваши очки: #{@player.points}"
    puts "Ваши деньги: #{@player.money}"
  end

  def add_card?
    add_card(@dealer) if @dealer.points < MAX_DEALER_POINTS
  end

  def add_card(player)
    player.take_card(deck) if player.cards.size < MAX_NUMBER_OF_CARDS
  end

  def next_game
    deck.refresh
    start
  end

  def finish_game?
    end_game if player.cards.size == MAX_NUMBER_OF_CARDS && dealer.cards.size == MAX_NUMBER_OF_CARDS
  end

  def who_won?
    @winner = nil
    if player.points != dealer.points && player.points <= MAX_POINTS && dealer.points <= MAX_POINTS
      if player.points > dealer.points
        @winner = player
      elsif player.points < dealer.points
        @winner = dealer
      end
    elsif player.points <= MAX_POINTS && dealer.points > MAX_POINTS
      @winner = player
    elsif dealer.points <= MAX_POINTS && player.points > MAX_POINTS
      @winner = dealer
    end
  end

  def end_game
    puts "Карты дилера: #{@dealer.cards}"
    puts "Сумма очков дилера: #{@dealer.points}"
    puts
    show_stats
    puts

    who_won?

    if @winner.nil?
      puts 'Ничья!'
      @players.each { |player| player.money += 10 }
    else
      puts "Победил - #{@winner.name}!"
      @winner.money += bank
    end

    puts
    puts 'Сыграть ещё раз?'
    puts '1 - Да'
    puts '2 - Нет'
    choice = $stdin.gets.chomp
    puts

    if choice == '1'
      next_game
    else
      exit
    end
  end
end

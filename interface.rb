class Interface
  attr_reader :game, :player

  def initialize(name)
    @player = Player.new(name)
    @deck = Deck.new
    @game = Game.new(@player, @deck)
  end

  def show_menu
    menu = ['1 - Пропустить', '2 - Добавить карту', '3 - Открыть карты']
    puts 'Выберите действие: '
    puts menu
  end

  def get_choice
    $stdin.gets.chomp
  end

  def start
    game.start

    loop do
      game.show_stats
      show_menu
      choice = get_choice
      puts
      action(choice)
    end
  end

  def action(choice)
    case choice.to_i

    when 1
      game.add_card?
      game.finish_game?
    when 2
      game.add_card(player)
      game.add_card?
      game.finish_game?
    when 3
      game.add_card?
      game.end_game

    end
  end
end

class Player
  attr_accessor :money
  attr_reader :name, :cards

  MAX_VALUE_ACE = 11
  MIN_VALUE_ACE = 1

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
  end

  def take_card(deck)
    @cards << deck.drop_card
  end

  def negative_balance?
    true if (money - 10).negative?
  end

  def bet
    self.money -= 10 unless negative_balance?
  end

  def points
    points = 0

    cards.sort.each do |card|
      card_value = card.chop

      points += 10 if %w[J Q K].include?(card_value)
      points += card_value.to_i unless %w[J Q K T].include?(card_value)
      if card_value.include?('T') && points <= 10
        points += MAX_VALUE_ACE
      elsif card_value.include?('T') && points > 10
        if cards.include?('T')
          points -= 9
        else
          points += MIN_VALUE_ACE
        end
      end
    end

    points
  end

  def clear
    @cards = []
  end
end

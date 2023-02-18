require_relative 'deck'
require_relative 'game'
require_relative 'player'
require_relative 'interface'

puts 'Введите ваше имя:'
name = $stdin.gets.chomp

interface = Interface.new(name)
interface.start

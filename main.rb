require_relative 'all_required'

puts "=========================BlackJack============================="
print "Your name: "
name = gets.chomp

black_jack = BlackJack.new(name)
black_jack.start
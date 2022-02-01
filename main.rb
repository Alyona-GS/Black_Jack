require_relative 'all_required'

puts "=================BlackJack==================="
print "Your name: "
name = gets.chomp.capitalize
puts "Hi, #{name}!
                   RULES

You have 100 dollars. Bet - 10 dollars/game.
Your aim: reach 21 point but not exceed it.

     Actions:                      Points:
pass - dealer turn            Pictures - 10
add  - add a card             Aces - 1 or 11
        (no more 3 cards)     Numbers - by nominal
open - finish the game

                  Good luck!"

black_jack = BlackJack.new(name)
black_jack.start
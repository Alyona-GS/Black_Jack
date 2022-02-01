module MessageSystem

  MAX_SCORE  = 21

  INIT_MONEY = 100
  BET        = 10

  INIT_CARDS = 2
  MAX_CARDS  = 3

  PICT_VALUE = 10
  BIG_ACE    = 11

  EXCEPT = {
    no_money:      "You don't have any money left",
    deal_no_money: "Dealer don't have money anymore",
    limit:         "You can't have more then #{MAX_CARDS} cards",
    no_action:     "You should print 'pass', 'open' or 'add'" }

  def mess_continue(player)
    puts  "=====================================",
          "Your money: #{player.money}"
    print "Do you want to start again?(y => yes, other key => no) "
  end
end
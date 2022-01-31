module MessageSystem

  INIT_MONEY = 100
  BET = 10
  MAX_SCORE = 21

  INIT_CARDS = 2
  MAX_CARDS = 3
  PICT_VALUE = 10
  BIG_ACE = 11

  EXCEPT = { over: "You've lost!",
             limit: "You can't have more then #{MAX_CARDS} cards" }
end
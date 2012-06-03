class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end

class String 
  def <=> (other)
    if self == other
      res = 0    
    elsif (self == "S" && other == "R") || (self == "R" && other == "P") || (self == "P" && other == "S") 
      res = 1
    else
      res = -1
    end
    res
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless game.all? {|x| x[1] =~ /^[SPR]$/}
  
  game.sort {|x,y| x[1] <=> y[1]}.take(1)[0]
end

# print rps_game_winner [ [ "Armando", "S" ], [ "Dave", "P" ] ]

def rps_tournament_winner(tournament)
  begin
    rps_game_winner tournament
  rescue NoSuchStrategyError
    rps_game_winner( [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
  
end

# print rps_tournament_winner [
  # [
    # [ ["Armando", "P"], ["Dave", "S"] ],
    # [ ["Richard", "R"], ["Michael", "S"] ],
  # ],
  # [
    # [ ["Allen", "S"], ["Omer", "P"] ],
    # [ ["David E.", "R"], ["Richard X.", "P"] ]
  # ]
# ]



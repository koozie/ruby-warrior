
class Player
  attr_reader :warrior
  def initialize
    @health_start = 20
    @health_last_round = 20
  end

  def play_turn(warrior)
    @warrior = warrior  

    if warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end

  private


end
  

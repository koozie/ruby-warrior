
class Player

  attr_reader :warrior, :health_start, :health_last_round

  def initialize
    @health_start = 20
    @health_last_round = 20
  end

  def play_turn(warrior)
    @warrior = warrior  

    action

    @health_last_round = warrior.health
  end

  private

  def action
    if warrior.feel.empty?
      if warrior.health < health_start and not taking_damage?
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
  end

  def taking_damage?
    warrior.health < health_last_round
  end

end
  


class Player

  attr_reader :warrior, :health_start, :health_last_round, :direction

  def initialize
    @health_start = 20
    @health_last_round = 20
    @direction = :backward
  end

  def play_turn(warrior)
    @warrior = warrior  

    if check_for_wall 
      if direction == :forward
        @direction = :backward
      else
        @direction = :forward
      end
    end

    action

    @health_last_round = warrior.health
  end

  private
  def check_for_wall
    warrior.feel(direction).wall?
  end
  def action
    if warrior.feel(direction).empty?
      if warrior.health < health_start and not taking_damage?
        warrior.rest!
      else
        warrior.walk!(direction)
      end
    else
      if warrior.feel.captive?
        warrior.rescue!(direction)
      else
        warrior.attack!(direction)
      end
    end
  end

  def taking_damage?
    warrior.health < health_last_round
  end

end
  

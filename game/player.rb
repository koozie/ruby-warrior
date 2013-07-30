
class Player

  attr_reader :warrior, :health_start, :health_last_round, :direction

  def initialize
    @health_start = 20
    @health_last_round = 20
    @direction = :backward
  end

  def play_turn(warrior)
    @warrior = warrior  

    reverse_direction if check_for_wall 

    action

    @health_last_round = warrior.health
  end

  private

  def check_for_wall
    warrior.feel(direction).wall?
  end

  def reverse_direction
    if direction == :forward
      @direction = :backward
    else
      @direction = :forward
    end
  end

  def action
    if warrior.feel(direction).empty?
      if taking_damage? and warrior.health < (health_start * 0.50)
        reverse_direction
        warrior.walk!(direction)
        reverse_direction
      elsif warrior.health < health_start and not taking_damage?
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
  

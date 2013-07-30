
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

    determine_action

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

  def fight_normal
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
        attack
      end
    end
  end
  def determine_action
    if enemy_bow_distance?
      warrior.shoot!
    else
      fight_normal
    end
  end
  def enemy_bow_distance?
    scan = warrior.look
    return false if scan.include?("Captive")
    scan.shift
    return true if scan.include?("Wizard")
    return false
  end


  def attack
    if enemy_behind_warrior?
      reverse_direction
      warrior.pivot!
    else
      warrior.attack!(direction)
    end
  end

  def enemy_behind_warrior?
    warrior.feel(:backward).enemy?
  end

  def taking_damage?
    warrior.health < health_last_round
  end

end
  

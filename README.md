Ruby-Warrior
============

Found this game today (28 JUL 2013) on hacker news located at the following
website, https://www.bloc.io/ruby-warrior/#/


Warrior Abilities
-----------------

    warrior.walk!    - Move in the given direction (forward by default)
    warrior.feel     - Returns a Space for the given direction (forward by default)
    warrior.attack!  - Attacks a unit in given direction (forward by default)
    warrior.health   - Returns an integer representing your health
    warrior.rest!    - Gain 10% of max health back, but do nothing more
    warrior.rescue!
    warrior.pivot!
    warrior.look     - To determine your surroundings
    warrior.shoot!   - To fire an arrow


Remember, you can only do one action (ending in !) per turn.

Level 06:
You can walk backward by passing ':backward' as an argument to walk!. Same goes for feel, rescue! and attack!. Archers have a limited attack distance.


Spaces
------

A space is an object representing a square in the level. This is what gets returned by warrior.feel. You can call methods on a space to gather information about what is there. Here are the various methods you can call on a space.

    space.empty?   - if true, 
    space.stairs?
    space.enemy?   - Is enemy?
    space.captive? - Is captive at location?
    space.wall?


Current Level
-------------

https://www.bloc.io/ruby-warrior/#/warriors/17492/levels/6

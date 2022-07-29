# frozen_string_literal: true

# A powerful warrior
class Warrior
  attr_writer :next_adventurer

  def initialize(power_level, name)
    @power_level = power_level
    @name = name
  end

  def next_adventurer(adventurer)
    @next_adventurer = adventurer

    adventurer
  end

  def slay_dragon(dragon)
    return @next_adventurer.slay_dragon(dragon) if @next_adventurer

    nil
  end
end

# A warrior who is trained to slay dragons
class DragonSlayer < Warrior
  def slay_dragon(dragon)
    dragon.skirmish_with_challenger(@power_level)

    if dragon.alive?
      super(dragon)
    else
      "I, #{name}, hath slain the foul beast! Quest complete!"
    end
  end
end

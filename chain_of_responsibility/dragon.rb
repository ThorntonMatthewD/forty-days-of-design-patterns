# frozen_string_literal: true

# A fearsome, scaled beast! Beware!!
class Dragon
  attr_reader :challengers_faced

  def initialize(power_level = 9001)
    @power_level = power_level
    @alive = true
    @challengers_faced = 0
  end

  def skirmish_with_challenger(challenger_power_level)
    @challengers_faced += 1
    @alive = false unless @power_level > challenger_power_level
  end

  def alive?
    @alive
  end
end

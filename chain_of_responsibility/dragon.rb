# frozen_string_literal: true

# A fearsome, scaled beast! Beware!!
class Dragon
  attr_reader :alive

  def initialize(power_level=9001)
    @power_level = power_level
    @alive = true
  end

  def skirmish_with_challenger(challenger_power_level)
    @alive = false unless @power_level > challenger_power_level
  end
end

# frozen_string_literal: true

# Produces a Raspberry Pi with or without a built-in wireless chip.
class AbstractPiFactory
  def create_pi_with_wireless_chip; end

  def create_pi_without_wireless_chip; end
end

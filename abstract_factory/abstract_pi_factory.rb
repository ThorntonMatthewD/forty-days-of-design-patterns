# frozen_string_literal: true

# Produces a Raspberry Pi with either a microcontroller or processor.
class AbstractPiFactory
  def create_pi_with_microcontroller; end

  def create_pi_with_processor; end
end

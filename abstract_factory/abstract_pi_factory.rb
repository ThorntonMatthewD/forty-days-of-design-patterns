# frozen_string_literal: true

# Produces a Raspberry Pi with different characteristics.
class AbstractPiFactory
  def create_base_model_pi; end

  def create_pi_with_wireless_chip; end

  def create_pi_with_headers; end

  def create_pi_with_wireless_chip_and_headers; end
end

# frozen_string_literal: true

require_relative 'pi_pico'
require_relative 'pi_zero'

# Creates Raspberry Pis with microcontrollers (Picos)
class PiMicrocontrollerFactory < AbstractPiFactory
  def create_base_model_pi
    PiPico.new
  end

  def create_pi_with_wireless_chip
    PiPicoW.new
  end

  def create_pi_with_headers
    PiPicoH.new
  end

  def create_pi_with_wireless_chip_and_headers
    PiPicoHW.new
  end
end

# Creates Raspberry Pis with processors (Zeros)
class PiProcessorFactory< AbstractPiFactory
  def create_base_model_pi
    PiZero.new
  end

  def create_pi_with_wireless_chip
    PiZeroW.new
  end

  def create_pi_with_headers
    PiZeroH.new
  end

  def create_pi_with_wireless_chip_and_headers
    PiZeroHW.new
  end
end

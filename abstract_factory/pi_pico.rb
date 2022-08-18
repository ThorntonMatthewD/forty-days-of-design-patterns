# frozen_string_literal: true

require_relative 'pi'

# Represents a Raspberry Pi Pico.. generally.
class AbstractPiPico < AbstractPi
  def microcontroller?; end
end

# Raspberry Pi Pico
class PiPico < AbstractPiPico
  def name
    'Raspberry Pi Pico'
  end

  def connect_to_network
    'I can\'t. I have no way to do that.'
  end

  def plug_into_breadboard
    'You\'ll need to solder on headers.'
  end

  def microcontroller?
    true
  end
end

# Raspberry Pi Pico W[ireless]
class PiPicoW < AbstractPiPico
  def name
    'Raspberry Pi Pico W'
  end

  def connect_to_network
    'Okay!'
  end

  def plug_into_breadboard
    'You\'ll need to solder on headers.'
  end

  def microcontroller?
    true
  end
end

# Raspberry Pi H[eaders]
class PiPicoH < AbstractPiPico
  def name
    'Raspberry Pi Pico H'
  end

  def connect_to_network
    'I can\'t. I have no way to do that.'
  end

  def plug_into_breadboard
    'Okay!'
  end

  def microcontroller?
    true
  end
end

# Raspberry Pi W[ireless] H[eaders]
class PiPicoHW < AbstractPiPico
  def name
    'Raspberry Pi Pico HW'
  end

  def connect_to_network
    'Okay!'
  end

  def plug_into_breadboard
    'Okay!'
  end

  def microcontroller?
    true
  end
end

# frozen_string_literal: true

require_relative 'pi'

# Represents a Raspberry Pi Zero.. generally.
class AbstractPiZero < AbstractPi
  def processor?; end
end

# Raspberry Pi Zero
class PiZero < AbstractPiZero
  def name
    'Raspberry Pi Zero'
  end

  def connect_to_network
    'I can\'t. I have no way to do that.'
  end

  def plug_into_breadboard
    'You\'ll need to solder on headers.'
  end

  def processor?
    true
  end
end

# Raspberry Pi Zero W[ireless]
class PiZeroW < AbstractPiZero
  def name
    'Raspberry Pi Zero W'
  end

  def connect_to_network
    'Okay!'
  end

  def plug_into_breadboard
    'You\'ll need to solder on headers.'
  end

  def processor?
    true
  end
end

# Raspberry Pi H[eaders]
class PiZeroH < AbstractPiZero
  def name
    'Raspberry Pi Zero H'
  end

  def connect_to_network
    'I can\'t. I have no way to do that.'
  end

  def plug_into_breadboard
    'Okay!'
  end

  def processor?
    true
  end
end

# Raspberry Pi W[ireless] H[eaders]
class PiZeroHW < AbstractPiZero
  def name
    'Raspberry Pi Zero HW'
  end

  def connect_to_network
    'Okay!'
  end

  def plug_into_breadboard
    'Okay!'
  end

  def processor?
    true
  end
end

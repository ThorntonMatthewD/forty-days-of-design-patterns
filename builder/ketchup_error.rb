# frozen_string_literal: true

# Leave the tomato syrup off of your sandwich.
class KethcupError < StandardError
  def initialize(msg = 'Ketchup detected. The burger has been discarded for your safety.')
    super
  end
end

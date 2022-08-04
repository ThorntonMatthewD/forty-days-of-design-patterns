# frozen_string_literal: true

# Leave the tomato syrup off of your sandwich.
class KetchupError < StandardError
  def initialize(msg = 'Ketchup detected. The burger has been discarded for your safety.')
    super
  end
end

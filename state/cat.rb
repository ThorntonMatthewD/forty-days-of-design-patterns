# frozen_string_literal: true

# A fuzzy little calico gremlin
class Penelope
  attr_accessor :state

  def initialize(state)
    change_state(state)
  end

  def current_state
    @state.name
  end

  def change_state(new_state)
    @state = new_state
    @state.context = self
  end

  def respond_to_food
    @state.respond_to_food
  end

  def respond_to_noise
    @state.respond_to_noise
  end

  # This is her favorite toy
  def respond_to_da_bee
    @state.respond_to_da_bee
  end
end

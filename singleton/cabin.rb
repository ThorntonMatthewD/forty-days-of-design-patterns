# frozen_string_literal: true

require 'singleton'

# An example of a singleton class, as well as a very cozy cabin.
class Cabin
  include Singleton

  def initialize
    @name = 'The Cozy Cabin'
    @door_locked = false
  end

  def lock_door
    @door_locked = true
  end

  def unlock_door
    @door_locked = false
  end
end

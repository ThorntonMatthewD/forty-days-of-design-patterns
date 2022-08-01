# frozen_string_literal: true

require 'singleton'

# An example of a singleton class, as well as a very cozy cabin.
class Cabin
  include Singleton

  def initialize
    @name = 'The Cozy Cabin'
  end
end

# frozen_string_literal: true

require 'ketchup_error'

# Makes burgers!
class BurgerBuilder
  attr_reader :burger

  def initialize
    create_base_burger
  end

  def create_base_burger
    @burger = ['patty', 'bottom bun']
  end

  def add_top_bun
    @burger.unshift('top bun')

    self
  end

  def add_cheese
    @burger.unshift('cheese')

    self
  end

  def add_lettuce
    @burger.unshift('cheese')

    self
  end

  def add_tomato
    @burger.unshift('cheese')

    self
  end

  def add_onion
    @burger.unshift('cheese')

    self
  end

  def add_ketchup
    @burger = []

    raise KethcupError
  end
end

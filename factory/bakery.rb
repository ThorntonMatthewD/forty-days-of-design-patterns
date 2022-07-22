# frozen_string_literal: true

require_relative 'factories/biscuit_factory'

biscuit_factory = BiscuitFactory.new

biscuit = biscuit_factory.make_food

p biscuit.knead_dough

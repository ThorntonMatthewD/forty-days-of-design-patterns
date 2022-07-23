# frozen_string_literal: true

require_relative 'factories/biscuit_factory'
require_relative 'factories/scone_factory'

biscuit_maker = BiscuitFactory.new
scone_maker = SconeFactory.new

scones = (1..10).map { scone_maker.make_food }
biscuits = (1..10).map { biscuit_maker.make_food }

p scones, biscuits

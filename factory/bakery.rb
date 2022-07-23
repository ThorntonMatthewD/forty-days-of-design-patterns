# frozen_string_literal: true

require_relative 'factories/biscuit_factory'
require_relative 'factories/scone_factory'

# Penelope's bakery! We serve biscuits and scones.
class Bakery
  def initialize
    @biscuit_maker = BiscuitFactory.new
    @scone_maker = SconeFactory.new
  end

  def prepare_goods(baked_good_type)
    case baked_good_type
    when 'Scone'
      (1..10).map { scone_maker.make_food }
    when 'Biscuit'
      (1..10).map { biscuit_maker.make_food }
    else
      raise 'Baked good type provided is invalid'
    end
  end
end

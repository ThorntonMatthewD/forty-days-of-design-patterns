# frozen_string_literal: true

require_relative 'base_baked_good_factory'
require_relative '../baked_goods/scone'

# A factory for making delicious scones
class SconeFactory < BaseBakedGoodFactory
  def make_food
    @scone = Scone.new

    prepare_dough
    process_dough
    bake_dough

    icing_request ? ice_scone : nil

    @scone
  end

  def prepare_dough
    @scone.preheat_oven
    @scone.mix_dry_ingredients
    @scone.cut_in_fat
    @scone.add_wet_ingredients
    @scone.mix_dough
  end

  def process_dough
    @scone.roll_dough
    @scone.cut_scone
    @scone.place_onto_pan
  end

  def bake_dough
    @scone.bake_scone
  end

  def ice_scone
    'Applied icing to scone'
  end
end

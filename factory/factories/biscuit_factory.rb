# frozen_string_literal: true

require_relative 'base_baked_good_factory'
require_relative '../baked_goods/biscuit'

# A factory for making delicious biscuits
class BiscuitFactory < BaseBakedGoodFactory
  def make_food
    @biscuit = Biscuit.new

    prepare_dough
    process_dough
    bake_dough

    @biscuit
  end

  def prepare_dough
    @biscuit.preheat_oven
    @biscuit.mix_dry_ingredients
    @biscuit.cut_in_fat
    @biscuit.add_wet_ingredients
    @biscuit.mix_dough
  end

  def process_dough
    @biscuit.roll_dough
    @biscuit.cut_biscuit
    @biscuit.place_onto_pan
  end

  def bake_dough
    @biscuit.bake_biscuit
  end
end

# frozen_string_literal: true

require_relative 'baked_good'

# A delicious scone
class Scone < BakedGood
  def preheat_oven
    'Oven has been set to 400F'
  end

  def mix_dry_ingredients
    'Added flour, salt, sugar, and baking powder to a bowl.'
  end

  def cut_in_fat
    'Butter has been cut into the dry ingredients'
  end

  def add_wet_ingredients
    'Added buttermilk, egg, blueberries, and vanilla extract to dry ingredients'
  end

  def mix_dough
    'Mixed all ingredients together'
  end

  def roll_dough
    'Dough has been rolled out'
  end

  def cut_scone
    'Dough has been cut into triangles'
  end

  def place_onto_pan
    'Cut scones have been placed onto a baking sheet'
  end

  def bake_scone
    'Scones have been baked in the oven'
  end
end

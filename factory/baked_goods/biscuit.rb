# frozen_string_literal: true

require_relative 'baked_good'

# A delicious cathead biscuit, made fresh daily by Chef Penelope 🐱
class Biscuit < BakedGood
  def preheat_oven
    'Oven has been set to 400F'
  end

  def mix_dry_ingredients
    'Added self-rising flour and salt to a bowl'
  end

  def cut_in_fat
    'Butter has been cut into the dry ingredients'
  end

  def add_wet_ingredients
    'Added buttermilk to dry ingredients'
  end

  def mix_dough
    'Mixed all ingredients together'
  end

  def roll_dough
    'Dough has been rolled out'
  end

  def cut_biscuit
    'Dough has been cut into biscuits'
  end

  def place_onto_pan
    'Cut biscuit dough has been placed onto a baking sheet'
  end

  def bake_biscuit
    'Biscuit dough has been baked in the oven'
  end

  def knead_dough
    puts "You're not supposed to knead biscuit dough! You must be a cat!"
  end
end

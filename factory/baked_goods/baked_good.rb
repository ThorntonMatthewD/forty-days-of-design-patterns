# frozen_string_literal: true

# A generic baked good
class BakedGood
  def preheat_oven
    raise NotImplementedError
  end

  def mix_dry_ingredients
    raise NotImplementedError
  end

  def cut_in_fat
    raise NotImplementedError
  end

  def add_wet_ingredients
    raise NotImplementedError
  end

  def mix_dough
    raise NotImplementedError
  end

  def roll_dough
    raise NotImplementedError
  end

  def cut_biscuit
    raise NotImplementedError
  end

  def place_onto_pan
    raise NotImplementedError
  end

  def bake_biscuit
    raise NotImplementedError
  end
end

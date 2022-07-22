# frozen_string_literal: true

# Abstract factory for making baked goods
class BaseBakedGoodFactory
  def make_food
    raise NotImplementedError
  end

  def prepare_dough
    raise NotImplementedError
  end

  def process_dough
    raise NotImplementedError
  end

  def bake_dough
    raise NotImplementedError
  end
end

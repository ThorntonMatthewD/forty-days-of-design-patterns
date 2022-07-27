# frozen_string_literal: true

# A feeder of animals
class Feeder
  def intiliaze(animals)
    @animals = animals
  end

  def get_out_food(food_type)
    animals.each { |animal| animal.respond_to_food(food_type) }
  end
end

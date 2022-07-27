# frozen_string_literal: true

# An animal that likes a specific type of food
class Animal
  def initialize
    @times_excited = 0
  end

  def respond_to_food(food_type)
    raise NotImplementedError
  end
end

# A cat that loves chicken!
class Cat < Animal
  def respond_to_food(food_type)
    @times_excited += 1 if food_type == 'chicken'
  end
end

# A furry potato with a hankering for veggies
class GuineaPig < Animal
  def respond_to_food(food_type)
    @times_excited += 1 if food_type == 'lettuce'
  end
end

# A dog that is excited if there's any food at all
class Dog < Animal
  def respond_to_food(food_type)
    @times_excited += 1 if food_type
  end
end

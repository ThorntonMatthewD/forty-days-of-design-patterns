# frozen_string_literal: true

# A state of being for a cat
class State
  attr_accessor :context

  def name
    raise NotImplementedError
  end

  def respond_to_food
    raise NotImplementedError
  end

  def respond_to_noise
    raise NotImplementedError
  end

  def respond_to_da_bee
    raise NotImplementedError
  end
end

# Sleepy kitty!
class Sleepy < State
  def name
    'Sleepy'
  end

  def respond_to_food
    'Penelope is too tired to chew.'
  end

  def respond_to_noise
    'Penelope covers rolls over and covers her eyes with her paws.'
  end

  def respond_to_da_bee
    @context.change_state(Playful.new)
    'Penelope\'s bloodlust for Bee is insatiable. She is awoken from her slumber in a fit of turbelent, furry fury.'
  end
end

# Must. Kill. Bee.
class Playful < State
  def name
    'Playful'
  end

  def respond_to_food
    'Penelope is undistracted from her quest to vanquish da bee.'
  end

  def respond_to_noise
    'Penelope runs over to the source of the noise to see if it is her bee.'
  end

  def respond_to_da_bee
    @context.change_state(Hungry.new)
    'Nothing like indescriminate hostility to work up one\'s appetite! Penelope is starving!'
  end
end

# Time for some Fancy Feast!
class Hungry < State
  def name
    'Hungry'
  end

  def respond_to_food
    @context.change_state(Sleepy.new)
    'Penelope goes to town on her puck of meat. She becomes sleepy.'
  end

  def respond_to_noise
    'Penelope rushes over to see what she hopes is food.'
  end

  def respond_to_da_bee
    'No time to play! Penelope only wants FOOD!'
  end
end

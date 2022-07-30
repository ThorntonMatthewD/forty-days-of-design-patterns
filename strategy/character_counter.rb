# frozen_string_literal: true

# Counts number of characters in a string
# How does it do it? Well, it depends!
class CharacterCounter
  attr_writer :counting_strategy

  def initialize(strategy)
    @counting_strategy = strategy
  end

  def count(string, char)
    @counting_strategy.count_characters(string, char)
  end
end

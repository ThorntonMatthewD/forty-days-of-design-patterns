# frozen_string_literal: true

# A trick known by the trainee. A command.
class Trick
  attr_writer :treats_present

  def initialize(trainee, trick_name, treats_present)
    @trainee = trainee
    @trick_name = trick_name
    @treats_present = treats_present
  end

  def perform_trick
    @trainee.maybe_perform_trick(@trick_name, @treats_present)
  end
end

# frozen_string_literal: true

# A recipient of commands.
class Trainee
  def initialize(name)
    @name = name
  end

  def maybe_perform_trick(trick_name, treat_present)
    return "#{@name} happily performed the #{trick_name} trick." if treat_present

    "If you want #{@name} to #{trick_name}, then you better have a treat ready."
  end
end

# frozen_string_literal: true

# A pseudo-random number generator.
class NumberGenerator
  def provide_number(requested_ceiling)
    raise NotImplementedError
  end
end

# A number
class RandomNumberGenerator < NumberGenerator
  def provide_number(requested_ceiling)
    rand(1..requested_ceiling)
  end
end

# A number generator that can only provide numbers between 1-100
class ProxyNumberGenerator < NumberGenerator
  def initialize(larger_number_generator)
    @larger_number_generator = larger_number_generator
    @number_limit = 100
    super()
  end

  def provide_number(requested_ceiling)
    return rand(1..@number_limit) if @number_limit >= requested_ceiling

    @larger_number_generator.provide_number(requested_ceiling)
  end
end

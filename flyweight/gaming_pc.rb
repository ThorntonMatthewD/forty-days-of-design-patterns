# frozen_string_literal: true

# A 1337 epic gamer rig xD
class GamingPC
  def initialize(pc_attrs)
    @pc_attrs = pc_attrs
  end

  def calculate_prime_numbers(silicon_lottery_rank)
    time_to_calculate = silicon_lottery_rank * 0.6

    "The #{@pc_attrs.cpu} revs up, and finds 1230 prime" \
      "numbers between 1 and 10000 in #{time_to_calculate} seconds."
  end
end

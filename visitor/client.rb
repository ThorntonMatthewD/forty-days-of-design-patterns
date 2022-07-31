# frozen_string_literal: true

# A potential grooming client
class Client
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def entertain_grooming_offer(groomer)
    raise NotImplementedError
  end
end

# A cat with lucious long fur. An organic hairball factory.
class LongHairCat < Client
  def entertain_grooming_offer(groomer)
    groomer.groom_longhair_cat(self)
  end
end

# Your run-of-the-mill American shorthair.
class ShortHairCat < Client
  def entertain_grooming_offer(groomer)
    groomer.groom_shorthair_cat(self)
  end
end

# Resembles poached chicken breast. Kind of cute, I guess?
class HairlessCat < Client
  def entertain_grooming_offer(groomer)
    groomer.groom_hairless_cat(self)
  end
end

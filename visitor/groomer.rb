# frozen_string_literal: true

# A cat groomer
class Groomer
  def groom_long_hair_cat(cat)
    raise NotImplementedError
  end

  def groom_short_hair_cat(cat)
    raise NotImplementedError
  end

  def groom_bald_cat(cat)
    raise NotImplementedError
  end
end

# If you scroll down the list far enough on CraigsList you will be greeted by
# KittyKlips, the traveling feline grooming service!
class KittyKlips < Groomer
  def groom_longhair_cat(cat)
    "#{cat.name} would love to be groomed. All of their hair is a lot to keep up with!"
  end

  def groom_shorthair_cat(cat)
    "#{cat.name} does not currently need groomed.  They're able to groom themselves."
  end

  def groom_hairless_cat(cat)
    "#{cat.name}'s owner wants to know if you need glasses."
  end
end

# frozen_string_literal: true

# A rung on the taxonomic tree
# Used in this case to represent the Felidae family and its constituents. 🐱
class TaxonomicCategory
  attr_accessor :parent

  def initialize(name)
    @name = name
    @children = []
  end

  def add_child(child)
    @children.append(child)
    child.parent = self
  end

  def remove_child(child)
    @children.remove(child)
    child.parent = nil
  end

  def can_have_children?
    true
  end

  def purr
    @children.map(&:purr)
  end
end

# The Felidae family is within the Carnivora order. Cats!
# https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180580
class Family < TaxonomicCategory; end

# Felinae is a subfamily of Felidae
# https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=552363#null
class Subfamily < TaxonomicCategory; end

# Felis is a genus within Felinae
# https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180586#null
class Genus < TaxonomicCategory; end

# Represents an individual species
class Species < TaxonomicCategory
  def initialize(binomial_nomenclature, colloquial_name, can_purr)
    @binomial_nomenclature = binomial_nomenclature
    @colloquial_name = colloquial_name
    @can_purr = can_purr
    super(binomial_nomenclature)
  end

  # Not counting subspecies within this example for the sake of my sanity.
  def can_have_children?
    false
  end

  def purr
    "The #{@colloquial_name} (#{@binomial_nomenclature}) #{@can_purr ? 'can' : 'cannot'} purr."
  end
end

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
    @children -= [child]
    child.parent = nil
  end

  def purr
    @children.map(&:purr).flatten
  end
end

class Family < TaxonomicCategory; end

class Subfamily < TaxonomicCategory; end

class Genus < TaxonomicCategory; end

# Represents an individual species
class Species < TaxonomicCategory
  def initialize(binomial_nomenclature, colloquial_name, can_purr)
    @binomial_nomenclature = binomial_nomenclature
    @colloquial_name = colloquial_name
    @can_purr = can_purr
    super(binomial_nomenclature)
  end

  def add_child(_)
    raise NoMethodError, 'Species cannot have children'
  end

  def remove_child(_)
    raise NoMethodError, 'Species do not have children to remove'
  end

  def purr
    "The #{@colloquial_name} (#{@binomial_nomenclature}) #{@can_purr ? 'can' : 'cannot'} purr."
  end
end

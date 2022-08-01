# frozen_string_literal: true

require 'rspec'

Dir.glob('composite/*.rb') do |file|
  require_relative "../../#{file}"
end

def add_children_to_parent(parent, children)
  children.each { |child| parent.add_child(child) }
end

def species_hashes_to_objects(species_hash)
  species_hash.map do |species|
    Species.new(species[:binomial_nomenclature],
                species[:colloquial_name],
                species[:can_purr])
  end
end

describe 'TaxonomicCategory - Composite' do
  before do
    # Add species to genera
    add_children_to_parent(felis_genus, species_hashes_to_objects(felis_species))
    add_children_to_parent(caracel_genus, species_hashes_to_objects(caracel_species))
    add_children_to_parent(panthera_genus, species_hashes_to_objects(panthera_species))
    add_children_to_parent(neofelis_genus, species_hashes_to_objects(neofelis_species))

    # Add genera to subfamilies
    add_children_to_parent(felinae_subfamily, [felis_genus, caracel_genus])
    add_children_to_parent(pantherinae_subfamily, [panthera_genus, neofelis_genus])

    # Add subfamilies to family
    add_children_to_parent(family, [felinae_subfamily, pantherinae_subfamily])
  end

  let(:family) { Family.new('Felidae') }

  let(:felinae_subfamily) { Subfamily.new('Felinae') }
  let(:pantherinae_subfamily) { Subfamily.new('Pantherinae') }

  let(:felis_genus) { Genus.new('Felis') }
  let(:caracel_genus) { Genus.new('Caracel') }
  let(:panthera_genus) { Genus.new('Panthera') }
  let(:neofelis_genus) { Genus.new('Neofelis') }

  let(:felis_species) do
    genus = 'Felis'
    [
      { binomial_nomenclature: "#{genus} catus", colloquial_name: 'House cat', can_purr: true },
      { binomial_nomenclature: "#{genus} margarita", colloquial_name: 'Sand cat', can_purr: true },
      { binomial_nomenclature: "#{genus} chaus", colloquial_name: 'Jungle cat', can_purr: true }
    ]
  end

  let(:caracel_species) do
    genus = 'Caracel'
    [
      { binomial_nomenclature: "#{genus} caracal", colloquial_name: 'Caracel', can_purr: true },
      { binomial_nomenclature: "#{genus} aurata", colloquial_name: 'African golden cat', can_purr: true }
    ]
  end

  let(:panthera_species) do
    genus = 'Panthera'
    [
      { binomial_nomenclature: "#{genus} leo", colloquial_name: 'Lion', can_purr: false },
      { binomial_nomenclature: "#{genus} tigris", colloquial_name: 'Tiger', can_purr: false }
    ]
  end

  let(:neofelis_species) do
    genus = 'Neofelis'
    [
      { binomial_nomenclature: "#{genus} nebulosa", colloquial_name: 'Clouded leopard', can_purr: false },
      { binomial_nomenclature: "#{genus} diardi", colloquial_name: 'Sunda clouded leopard', can_purr: false }
    ]
  end

  describe '.purr' do
    it 'calling purr on the family gets the results for everyone' do
      expect(family.purr).to match_array(
        ['The House cat (Felis catus) can purr.',
         'The Sand cat (Felis margarita) can purr.',
         'The Jungle cat (Felis chaus) can purr.',
         'The Caracel (Caracel caracal) can purr.',
         'The African golden cat (Caracel aurata) can purr.',
         'The Lion (Panthera leo) cannot purr.',
         'The Tiger (Panthera tigris) cannot purr.',
         'The Clouded leopard (Neofelis nebulosa) cannot purr.',
         'The Sunda clouded leopard (Neofelis diardi) cannot purr.']
      )
    end

    it 'calling purr on a subfamily gets the results for just that subfamily' do
      expect(felinae_subfamily.purr).to match_array(
        ['The House cat (Felis catus) can purr.',
         'The Sand cat (Felis margarita) can purr.',
         'The Jungle cat (Felis chaus) can purr.',
         'The Caracel (Caracel caracal) can purr.',
         'The African golden cat (Caracel aurata) can purr.']
      )
    end

    it 'calling purr on a genus gets the results for just that genus' do
      expect(felis_genus.purr).to match_array(
        ['The House cat (Felis catus) can purr.',
         'The Jungle cat (Felis chaus) can purr.',
         'The Sand cat (Felis margarita) can purr.']
      )
    end

    it 'calling purr on a species gets the results for just that species' do
      species_that_purrs = Species.new('Felis catus', 'House cat', true)
      species_that_does_not_purr = Species.new('Panthera leo', 'Lion', false)

      expect(species_that_purrs.purr).to eq 'The House cat (Felis catus) can purr.'
      expect(species_that_does_not_purr.purr).to eq 'The Lion (Panthera leo) cannot purr.'
    end
  end

  describe Species do
    let(:species) { Species.new('Felis catus', 'House cat', true) }

    it 'cannot add children to species' do
      expect { species.add_child('Some subspecies') }.to raise_exception(NoMethodError)
    end

    it 'cannot remove children from species (they don\'t have any)' do
      expect { species.remove_child('Some subspecies') }.to raise_exception(NoMethodError)
    end
  end

  describe 'remove_child' do
    it 'removing a subfamily from the family causes it and its descendents to no longer appear' do
      family.remove_child(pantherinae_subfamily)
      expect(family.purr).to match_array(
        ['The House cat (Felis catus) can purr.',
         'The Sand cat (Felis margarita) can purr.',
         'The Jungle cat (Felis chaus) can purr.',
         'The Caracel (Caracel caracal) can purr.',
         'The African golden cat (Caracel aurata) can purr.']
      )
    end
  end
end

# frozen_string_literal: true

require 'rspec'

Dir.glob('visitor/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'Groomer - Visitor' do
  let(:longhair_cat) { LongHairCat.new('Tinkerbell') }
  let(:shorthair_cat) { ShortHairCat.new('Sprinkles') }
  let(:hairless_cat) { HairlessCat.new('Pinky') }
  let(:groomer) { KittyKlips.new }

  it 'groomer receives the response for longhair cats whenever visiting one' do
    expect(longhair_cat.entertain_grooming_offer(groomer)).to eq(
      "#{longhair_cat.name} would love to be groomed. All of their hair is a lot to keep up with!"
    )
  end

  it 'groomer receives the response for shorthair cats whenever visiting one' do
    expect(shorthair_cat.entertain_grooming_offer(groomer)).to eq(
      "#{shorthair_cat.name} does not currently need groomed.  They're able to groom themselves."
    )
  end

  it 'groomer receives the response for longhair cats whenever visiting one' do
    expect(hairless_cat.entertain_grooming_offer(groomer)).to eq(
      "#{hairless_cat.name}'s owner wants to know if you need glasses."
    )
  end
end

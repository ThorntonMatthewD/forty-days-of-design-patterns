# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../factory/baked_goods/baked_good', __dir__)

# Interface for baked goods
describe BakedGood do
  subject { BakedGood.new }

  it '.preheat_oven' do
    expect { subject.preheat_oven }.to raise_exception(NotImplementedError)
  end

  it '.mix_dry_ingredients' do
    expect { subject.mix_dry_ingredients }.to raise_exception(NotImplementedError)
  end

  it '.cut_in_fat' do
    expect { subject.cut_in_fat }.to raise_exception(NotImplementedError)
  end

  it '.add_wet_ingredients' do
    expect { subject.add_wet_ingredients }.to raise_exception(NotImplementedError)
  end

  it '.mix_dough' do
    expect { subject.mix_dough }.to raise_exception(NotImplementedError)
  end

  it '.roll_dough' do
    expect { subject.roll_dough }.to raise_exception(NotImplementedError)
  end

  it '.cut_biscuit' do
    expect { subject.cut_biscuit }.to raise_exception(NotImplementedError)
  end

  it '.place_onto_pan' do
    expect { subject.place_onto_pan }.to raise_exception(NotImplementedError)
  end

  it '.bake_biscuit' do
    expect { subject.bake_biscuit }.to raise_exception(NotImplementedError)
  end
end

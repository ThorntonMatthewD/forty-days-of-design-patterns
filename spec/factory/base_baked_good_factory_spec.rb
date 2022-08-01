# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../factory/factories/base_baked_good_factory', __dir__)

# Interface for baked good factories
describe BaseBakedGoodFactory do
  subject { BaseBakedGoodFactory.new }

  it '.make_food' do
    expect { subject.make_food }.to raise_exception(NotImplementedError)
  end

  it '.prepare_dough' do
    expect { subject.prepare_dough }.to raise_exception(NotImplementedError)
  end

  it '.process_dough' do
    expect { subject.process_dough }.to raise_exception(NotImplementedError)
  end

  it '.bake_dough' do
    expect { subject.bake_dough }.to raise_exception(NotImplementedError)
  end
end

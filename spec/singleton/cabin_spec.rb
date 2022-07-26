# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../singleton/cabin', __dir__)

describe 'Cabin - Singleton' do
  it 'Cabin includes Singleton module' do
    expect(Cabin.ancestors.include?(Singleton)).to eq true
  end

  it 'Instances of singleton Cabin class cannot be created' do
    expect { Cabin.new }.to raise_exception(NoMethodError)
  end

  it 'Instance ID for Cabin remains the same' do
    expect(Cabin.instance.object_id).to eq Cabin.instance.object_id
  end
end

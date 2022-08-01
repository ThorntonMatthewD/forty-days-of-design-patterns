# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../visitor/client', __dir__)

describe Client do
  let(:name) { 'Skittles' }

  subject { Client.new(name) }

  it 'name of client is accessible' do
    expect(subject.name).to eq name
  end

  it '.entertain_grooming_offer is not implemented on the interface' do
    expect { subject.entertain_grooming_offer('groomer') }.to raise_exception(NotImplementedError)
  end
end
# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../decorator/converters', __dir__)

describe 'StorageDecorator - Interface' do
  let(:data) { (1..10).to_a }
  let(:data_store) { HardDrive.new(data) }

  subject { DataStore.new(data_store) }

  it '.retrieve_data is not implemented on the interface and throws a NotImplementedError' do
    expect { subject.retrieve_data }.to raise_exception(NotImplementedError)
  end
end

# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../decorator/converters', __dir__)

describe 'StorageDecorator - Interface' do
  let(:data) { (1..10).to_a }
  let(:data_store) { HardDrive.new(data) }

  subject { StorageDecorator.new(data_store) }

  it 'data_store attribute is directly accessible for reading and modification' do
    expect(subject.data_store).to eq data_store

    new_data = (10..20).to_a
    new_data_store = HardDrive.new(new_data)
    subject.data_store = new_data_store

    expect(subject.data_store).to eq new_data_store
  end

  it '.retrieve_data is not implemented on the interface and throws a NotImplementedError' do
    expect { subject.retrieve_data }.to raise_exception(NotImplementedError)
  end
end

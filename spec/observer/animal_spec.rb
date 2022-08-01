# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../observer/animal', __dir__)

describe 'Animal - Interface' do
  subject { Animal.new }
  describe ':times_excited' do
    it ':times_excited can be directly read and modified' do
      expect(subject.times_excited).to eq 0

      subject.times_excited = 999

      expect(subject.times_excited).to eq 999
    end
  end

  it '.respond_to_food is not implemented on the interface and throws a NotImplementedError' do
    expect { subject.respond_to_food('pizza') }.to raise_exception(NotImplementedError)
  end
end

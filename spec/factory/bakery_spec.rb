# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../factory/bakery', __dir__)

describe 'Bakery - Factory' do
  subject { Bakery.new.prepare_goods(baked_good_type) }

  context 'Ordering scones' do
    let(:baked_good_type) { 'Scone' }

    it 'results in an array of scrumptious scones' do
      expect(subject.all? { |r| r.is_a?(Scone) }).to eq true
    end

    it 'produces a bakers dozen of items' do
      expect(subject.count).to eq 13
    end
  end

  context 'Ordering biscuits' do
    let(:baked_good_type) { 'Biscuit' }

    it 'results in an array of scrumptious scones' do
      expect(subject.all? { |r| r.is_a?(Biscuit) }).to eq true
    end

    it 'produces a bakers dozen of items' do
      expect(subject.count).to eq 13
    end
  end

  context 'Ordering invalid baked goods' do
    let(:baked_good_type) { 'Chicken' }

    it 'causes an error to be raised' do
      expect { subject }.to raise_exception(RuntimeError, 'Baked good type provided is invalid')
    end
  end
end

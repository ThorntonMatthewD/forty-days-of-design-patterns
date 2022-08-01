# frozen_string_literal: true

require 'rspec'

Dir.glob('strategy/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'CharacterCounter - Strategy' do
  let(:test_string) { 'My cat is pretty stinky.' }
  let(:test_char) { 't' }
  let(:expected_count) { 4 }

  shared_examples 'a right proper counting strategy' do
    it 'counts the correct number of characters' do
      expect(subject.count(test_string, test_char)).to eq(
        {
          strategy: expected_strategy_name,
          count: expected_count
        }
      )
    end

    it 'the strategy can be switched, and still gets the correct count' do
      subject.counting_strategy = opposite_strategy

      expect(subject.count(test_string, test_char)).to eq(
        {
          strategy: opposite_strategy_name,
          count: expected_count
        }
      )
    end
  end

  context 'using the CounterWithScan strategy' do
    let(:expected_strategy_name) { 'scan' }
    let(:opposite_strategy_name) { 'count' }
    let(:opposite_strategy) { CounterWithCount.new }

    subject { CharacterCounter.new(CounterWithScan.new) }

    it_behaves_like 'a right proper counting strategy'
  end

  context 'using the CounterWithCount strategy' do
    let(:expected_strategy_name) { 'count' }
    let(:opposite_strategy_name) { 'scan' }
    let(:opposite_strategy) { CounterWithScan.new }

    subject { CharacterCounter.new(CounterWithCount.new) }

    it_behaves_like 'a right proper counting strategy'
  end
end

describe CountingStrategy do
  let(:counting_strategy) { CountingStrategy.new }
  it '.count_characters on base CountingStrategy class objects throws NotImplementedError' do
    expect { counting_strategy.count_characters('', '') }.to raise_exception(NotImplementedError)
  end
end

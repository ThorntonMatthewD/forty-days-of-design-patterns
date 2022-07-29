# frozen_string_literal: true

require 'rspec'

Dir.glob('chain_of_responsibility/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'Dragon Slayer - Chain of Responsibility' do
  before(:each) do
    dragon_slayers[0].next_adventurer(dragon_slayers[1]).next_adventurer(dragon_slayers[2])
  end

  let(:dragon_slayers) { (4..6).map { |n| DragonSlayer.new((n * n**n), "Dragon Slayer #{n}") } }
  let(:initial_slayer) { dragon_slayers[0] }
  let(:dragon) { Dragon.new }

  subject { initial_slayer.slay_dragon(dragon) }

  it 'the dragon is slain once it meets a powerful enough opponent' do
    slay_result = subject

    expect(slay_result).to eq 'I, Dragon Slayer 5, hath slain the foul beast! Quest complete!'
    expect(dragon.challengers_faced).to eq 2
    expect(dragon.alive?).to eq false
  end
end

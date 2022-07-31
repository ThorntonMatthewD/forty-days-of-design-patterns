# frozen_string_literal: true

require 'rspec'

Dir.glob('command/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'Trainer - Command' do
  before(:each) do
    trainer.issue_sit = sit
    trainer.issue_spin = spin
    trainer.issue_give_paw = give_paw
  end

  let(:trainer) { Matt.new }
  let(:trainee) { Trainee.new('Penelope') }

  # Tricks/Commands
  let(:sit) { Trick.new(trainee, 'sit', treats_present) }
  let(:spin) { Trick.new(trainee, 'spin', treats_present) }
  let(:give_paw) { Trick.new(trainee, 'give paw', treats_present) }

  context 'whenever there are no treats the trainee refuses to perform' do
    let(:treats_present) { false }

    it 'sit trick' do
      expect(trainer.issue_sit).to eq(
        'If you want Penelope to sit, then you better have a treat ready.'
      )
    end

    it 'spin trick' do
      expect(trainer.issue_spin).to eq(
        'If you want Penelope to spin, then you better have a treat ready.'
      )
    end

    it 'give paw trick' do
      expect(trainer.issue_give_paw).to eq(
        'If you want Penelope to give paw, then you better have a treat ready.'
      )
    end
  end

  context 'whenever there are treats the trainee performs' do
    let!(:treats_present) { true }

    it 'sit trick' do
      expect(trainer.issue_sit).to eq(
        'Penelope happily performed the sit trick.'
      )
    end

    it 'spin trick' do
      expect(trainer.issue_spin).to eq(
        'Penelope happily performed the spin trick.'
      )
    end

    it 'give paw trick' do
      expect(trainer.issue_give_paw).to eq(
        'Penelope happily performed the give paw trick.'
      )
    end
  end
end

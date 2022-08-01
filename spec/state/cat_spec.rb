# frozen_string_literal: true

require 'rspec'

Dir.glob('state/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'Penelope - State' do
  describe 'Sleepy Penelope' do
    subject { Penelope.new(Sleepy.new) }

    it 'current state is Sleepy' do
      expect(subject.current_state).to eq 'Sleepy'
    end

    it 'is not interested in food' do
      expect(subject.respond_to_food).to eq 'Penelope is too tired to chew.'
      expect(subject.current_state).to eq 'Sleepy'
    end

    it 'wishes for peace and quiet' do
      expect(subject.respond_to_noise).to eq 'Penelope covers rolls over and covers her eyes with her paws.'
      expect(subject.current_state).to eq 'Sleepy'
    end

    it 'will wake up to take on da bee' do
      expect(subject.respond_to_da_bee).to eq(
        'Penelope\'s bloodlust for Bee is insatiable. ' \
          'She is awoken from her slumber in a fit of turbelent, furry fury.'
      )
      expect(subject.current_state).to eq 'Playful'
    end
  end

  describe 'Playful Penelope' do
    subject { Penelope.new(Playful.new) }

    it 'current state is Playful' do
      expect(subject.current_state).to eq 'Playful'
    end

    it 'is not interested in food' do
      expect(subject.respond_to_food).to eq 'Penelope is undistracted from her quest to vanquish da bee.'
      expect(subject.current_state).to eq 'Playful'
    end

    it 'responds to noise in hopes of finding bee' do
      expect(subject.respond_to_noise).to eq 'Penelope runs over to the source of the noise to see if it is her bee.'
      expect(subject.current_state).to eq 'Playful'
    end

    it 'huntign da bee hungers the beast' do
      expect(subject.respond_to_da_bee).to eq(
        'Nothing like indescriminate hostility to work up one\'s appetite! Penelope is starving!'
      )
      expect(subject.current_state).to eq 'Hungry'
    end
  end

  describe 'Hungry Penelope' do
    subject { Penelope.new(Hungry.new) }

    it 'current state is Sleepy' do
      expect(subject.current_state).to eq 'Hungry'
    end

    it 'enjoys her food and then gets sleepy' do
      expect(subject.respond_to_food).to eq 'Penelope goes to town on her puck of meat. She becomes sleepy.'
      expect(subject.current_state).to eq 'Sleepy'
    end

    it 'is hopeful that noise means food' do
      expect(subject.respond_to_noise).to eq 'Penelope rushes over to see what she hopes is food.'
      expect(subject.current_state).to eq 'Hungry'
    end

    it 'is not interested in da bee while hungry' do
      expect(subject.respond_to_da_bee).to eq 'No time to play! Penelope only wants FOOD!'
      expect(subject.current_state).to eq 'Hungry'
    end
  end

  describe State do
    let(:state) { State.new }

    it '.name throws NotImplementedError' do
      expect { state.name }.to raise_exception(NotImplementedError)
    end

    it '.respond_to_food throws NotImplementedError' do
      expect { state.respond_to_food }.to raise_exception(NotImplementedError)
    end

    it '.respond_to_noise throws NotImplementedError' do
      expect { state.respond_to_noise }.to raise_exception(NotImplementedError)
    end

    it '.respond_to_da_bee throws NotImplementedError' do
      expect { state.respond_to_da_bee }.to raise_exception(NotImplementedError)
    end
  end
end

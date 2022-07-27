# frozen_string_literal: true

require 'rspec'

Dir.glob('observer/*.rb') do |file|
  require_relative "../../#{file}"
end

CAT_NDX = 0
DOG_NDX = 1
GUINEA_PIG_NDX = 2

describe 'Feeder - Observer' do
  before(:each) do
    @pre_feeding_excitement_counts = [cat.times_excited, dog.times_excited, guinea_pig.times_excited]
  end

  let(:cat) { Cat.new }
  let(:dog) { Dog.new }
  let(:guinea_pig) { GuineaPig.new }

  let(:menagerie) { [cat, dog, guinea_pig] }

  subject { Feeder.new(menagerie) }

  it 'no animal is excited if there is no food' do
    subject.get_out_food

    expect(@pre_feeding_excitement_counts).to eq [cat.times_excited, dog.times_excited, guinea_pig.times_excited]
  end

  it 'at the sound of a can of chicken opening the cat and the dog are thrilled' do
    subject.get_out_food('chicken')

    expect([cat.times_excited, dog.times_excited, guinea_pig.times_excited]).to eq [
      @pre_feeding_excitement_counts[CAT_NDX] + 1,
      @pre_feeding_excitement_counts[DOG_NDX] + 1,
      @pre_feeding_excitement_counts[GUINEA_PIG_NDX]
    ]
  end

  it 'a crinkling of a bag of lettuces sends the guinea pig and dog into a frenzy' do
    subject.get_out_food('lettuce')

    expect([cat.times_excited, dog.times_excited, guinea_pig.times_excited]).to eq [
      @pre_feeding_excitement_counts[CAT_NDX],
      @pre_feeding_excitement_counts[DOG_NDX] + 1,
      @pre_feeding_excitement_counts[GUINEA_PIG_NDX] + 1
    ]
  end

  it 'you reach into the refrigerator to pull out a moldy, slimey ball that was perhaps once a peach,
    and the dog loses its absolute mind' do
    subject.get_out_food('slimey peach (???)')

    expect([cat.times_excited, dog.times_excited, guinea_pig.times_excited]).to eq [
      @pre_feeding_excitement_counts[CAT_NDX],
      @pre_feeding_excitement_counts[DOG_NDX] + 1,
      @pre_feeding_excitement_counts[GUINEA_PIG_NDX]
    ]
  end
end

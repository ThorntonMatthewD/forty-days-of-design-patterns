# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../builder/burger_builder', __dir__)

describe 'BurgerBuilder - Builder' do
  subject { BurgerBuilder.new }

  it 'burger is created how we specify' do
    # Build a very "cheese-forward" burger
    subject.add_cheese.add_lettuce.add_onion.add_tomato.add_cheese.add_top_bun.burger

    expect(subject.burger).to match_array(
      [
        'top bun',
        'cheese',
        'cheese',
        'cheese',
        'cheese',
        'cheese',
        'patty',
        'bottom bun'
      ]
    )
  end

  it 'the burger builder prevents us from committing a heinous act against our sandwich' do
    subject.add_cheese.add_lettuce.add_top_bun

    expect(subject.burger).to match_array ['bottom bun', 'cheese', 'cheese', 'patty', 'top bun']

    expect { subject.add_ketchup }.to raise_exception(
      KetchupError,
      'Ketchup detected. The burger has been discarded for your safety.'
    )

    expect(subject.burger).to match_array []
  end
end

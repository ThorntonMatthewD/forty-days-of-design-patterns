# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../prototype/recipe', __dir__)

describe 'Recipe - Prototype' do
  let(:recipe) do
    {
      title: 'Very Yummy Recipe',
      description: 'Something tasty',
      instructions: "1. Add food to pan.\n2. Apply heat.\n3. ???\n4. Eat!!!!"
    }
  end

  shared_examples 'copy creates exact copy' do
    describe '#copy_recipe' do
      it do
        copy = subject.copy_recipe

        expect(copy.recipe).to eq recipe
      end
    end
  end

  describe Recipe do
    subject { Recipe.new(recipe) }

    it_behaves_like 'copy creates exact copy'

    describe '#display_article' do
      it { expect { subject.display_article }.to raise_exception(NotImplementedError) }
    end
  end

  describe CookingIsFunRecipe do
    subject { CookingIsFunRecipe.new(recipe) }

    it_behaves_like 'copy creates exact copy'

    describe '#display_article' do
      it {
        expect(subject.display_article).to eq "Welcome to Cooking is Fun!\n\n" \
                                              "Very Yummy Recipe\nSomething tasty1. " \
                                              "Add food to pan.\n2. Apply heat.\n3. ???\n4. Eat!!!!"
      }
    end
  end

  describe CookingIsLiteralTortureRecipe do
    subject { CookingIsLiteralTortureRecipe.new(recipe) }

    it_behaves_like 'copy creates exact copy'

    describe '#display_article' do
      it {
        expect(subject.display_article).to eq 'Cooking is Literal Torture, and this recipe ' \
                                              "will be no different.\n\nVery Yummy Recipe\nSomething tasty1. " \
                                              "Add food to pan.\n2. Apply heat.\n3. ???\n4. Eat!!!!"
      }
    end
  end

  describe YesItIsFoodRecipe do
    subject { YesItIsFoodRecipe.new(recipe) }

    it_behaves_like 'copy creates exact copy'

    describe '#display_article' do
      it {
        expect(subject.display_article).to eq 'Yes, it IS Food!! I promise. I really do. ' \
                                              "It's DEFINITELY \"food\". Uh-huh. ;D\n\n" \
                                              "Very Yummy Recipe\nSomething tasty1. " \
                                              "Add food to pan.\n2. Apply heat.\n3. ???\n4. Eat!!!!"
      }
    end
  end
end

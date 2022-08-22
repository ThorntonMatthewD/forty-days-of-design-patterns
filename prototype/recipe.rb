# frozen_string_literal: true

# A recipe for a web page
class Recipe
  attr_accessor :recipe

  def initialize(recipe)
    @recipe = recipe
  end

  def copy_recipe
    self.class.new(@recipe)
  end

  def display_article
    raise NotImplementedError, 'Without this, how the heck are you supposed to run a recipe site???'
  end
end

# A sister-site for those who enjoy cooking.
class CookingIsFunRecipe < Recipe
  def initialize(recipe)
    @site_name = 'Cooking is Fun'
    super(recipe)
  end

  def display_article
    "Welcome to #{@site_name}!\n\n" \
      "#{@recipe[:title]}\n#{@recipe[:description]}" \
      "#{@recipe[:instructions]}"
  end
end

# A sister-site for those with better things to do.
class CookingIsLiteralTortureRecipe < Recipe
  def initialize(recipe)
    @site_name = 'Cooking is Literal Torture'
    super(recipe)
  end

  def display_article
    "#{@site_name}, and this recipe will be no different.\n\n" \
      "#{@recipe[:title]}\n#{@recipe[:description]}" \
      "#{@recipe[:instructions]}"
  end
end

# A new site for those that need extra reassurance about the most basic things.
class YesItIsFoodRecipe < Recipe
  def initialize(recipe)
    @site_name = 'Yes, it IS Food!'
    super(recipe)
  end

  def display_article
    "#{@site_name}! I promise. I really do. It's DEFINITELY \"food\". Uh-huh. ;D\n\n" \
      "#{@recipe[:title]}\n#{@recipe[:description]}" \
      "#{@recipe[:instructions]}"
  end
end

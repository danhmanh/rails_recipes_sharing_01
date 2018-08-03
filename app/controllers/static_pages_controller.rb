class StaticPagesController < ApplicationController
  def home
    @favor = Favor.rela current_user.id, @recipe
    @categories = Category.order_by_name
    @categorieshome = Category.order_by_name.page(params[:page])
                              .per Settings.num_category
    @recipes = Recipe.limit(Settings.limit_recipe).hot_recipe.desc
    ingredients = ""
    @topusers = User.limit(Settings.limit_top_user_home).top_user
  end
end

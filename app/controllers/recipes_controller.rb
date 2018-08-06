class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.desc.page(params[:page])
      .per Settings.recipe_per_index
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
    @recipe.steps.build
    @recipe.recipe_ingredients.build
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.category_ids = params[:recipe][:category_ids]
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @user = @recipe.user
    @favor = Favor.rela current_user.id, @recipe
    @bookmark = Favor.rela_bookmark current_user.id, @recipe
    @comments = @recipe.comments.all
    @comment = @recipe.comments.build
  end

  def edit; end

  def update
    if @recipe.update_attributes recipe_params
      flash[:success] = t ".save_success"
      redirect_to @recipe
    else
      flash[:danger] = t ".save_failed"
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cover_photo,
      :description, :purpose, :ready_in, :difficult_level, :category_ids,
      :people_num, steps_attributes: [:id, :content, :_destroy, {photos: []}],
      recipe_ingredients_attributes: [:id, :name, :amount, :measurement])
          .merge user_id: current_user.id
  end

  def find_recipe
    @recipe = Recipe.find_by id: params[:id]

    return if @recipe
    flash[:danger] = t ".cant_find"
    redirect_to root_path

  end
end

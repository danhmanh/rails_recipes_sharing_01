class FavorsController < ApplicationController
  before_action :find_recipe, only: %i(create destroy)

  def create
    return if current_user.liked? @recipe
    if params[:status] == "1"
      @favor = Favor.new status: "like_recipe", user: current_user,
        targetable: @recipe
      if @favor.save
        @favor = Favor.rela current_user.id, @recipe
        respond_to do |format|
          format.html {redirect_to @recipe}
          format.js
        end
      else
        flash[:warning] = t ".failed"
      end
    end
  end

  def destroy
    @favor = Favor.find_by id: params[:id]
    @favor.destroy
    respond_to do |format|
      format.html {redirect_to @recipe}
      format.js
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by id: params[:recipe_id]

    return if @recipe
    redirect_to root_path
  end
end

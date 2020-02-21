class ChefIngredientsController< ApplicationController

  def show 
    chef = Chef.find(params[:id])
    @ingredients = chef.used_ingredients
  end

end
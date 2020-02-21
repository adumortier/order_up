class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def used_ingredients
    dishes.distinct.joins(:ingredients).pluck("ingredients.name")
  end

end

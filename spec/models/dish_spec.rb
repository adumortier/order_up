require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients}
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "methods" do 
    
    it "can count the total calories of a dish" do
    @chef = Chef.create!(name: "Alex")

    @dish1 = @chef.dishes.create(name: "steak fries", description: "Amazing")
    @ingredient1 = Ingredient.create!(name: "meat", calories: 400)
    @ingredient2 = Ingredient.create!(name: "fries", calories: 200)
    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2

    expect(@dish1.total_calories).to eq 600
    end
  end

end

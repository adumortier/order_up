require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    it "should return a list of ingredients used by the chef" do 
      @chef = Chef.create!(name: "Alex")
      @dish1 = @chef.dishes.create(name: "steak fries", description: "Amazing")
      @ingredient1 = Ingredient.create!(name: "meat", calories: 400)
      @ingredient2 = Ingredient.create!(name: "fries", calories: 200)
      @ingredient3 = Ingredient.create!(name: "marshmallows", calories: 300)
      @dish1.ingredients << @ingredient1
      @dish1.ingredients << @ingredient2
      @dish2 = @chef.dishes.create(name: "steak carrots", description: "Amazing")
      @ingredient1 = Ingredient.create!(name: "meat", calories: 400)
      @ingredient3 = Ingredient.create!(name: "carrots", calories: 200)
      @dish2.ingredients << @ingredient1
      @dish2.ingredients << @ingredient3
      expect(@chef.used_ingredients).to eq(["carrots", "fries", "meat"])
    end

  end
end

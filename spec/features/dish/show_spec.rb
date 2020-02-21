require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 

  describe 'when I visit a dish show page' do 

    before(:each) do 
      @chef = Chef.create!(name: "Alex")
      @dish1 = @chef.dishes.create(name: "steak fries", description: "Amazing")
      @ingredient1 = Ingredient.create!(name: "meat", calories: 400)
      @ingredient2 = Ingredient.create!(name: "fries", calories: 200)
      @dish1.ingredients << @ingredient1
      @dish1.ingredients << @ingredient2
      visit "/dish/#{@dish1.id}"
    end

    it 'displays the dish info' do 

      expect(page).to have_content("Name: #{@dish1.name}")
      expect(page).to have_content("Chef: #{@dish1.chef.name}")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end

    it 'displays the total calorie count' do
      expect(page).to have_content("Total calorie count: #{@ingredient1.calories + @ingredient2.calories}")
    end

  end

end

# Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the name of the chef that made that dish
# And I see a list of ingredients for that dish

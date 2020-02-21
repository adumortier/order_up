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
    end

    it 'displays the dish info' do 

      visit "/dish/#{@dish1.id}"

      expect(page).to have_content("Name: #{@dish1.name}")
      expect(page).to have_content("Chef: #{@dish1.chef.name}")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end

    it 'test_name_here' do

    end

  end

end

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the name of the chef that made that dish
# And I see a list of ingredients for that dish

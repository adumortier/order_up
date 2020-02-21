require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 

  describe "When I visit a chef's show page" do 

    before(:each) do
      @chef = Chef.create!(name: "Alex")
      @dish1 = @chef.dishes.create(name: "steak fries", description: "Amazing")
      @ingredient1 = Ingredient.create!(name: "meat", calories: 400)
      @ingredient2 = Ingredient.create!(name: "fries", calories: 200)
      @ingredient3 = Ingredient.create!(name: "marshmallows", calories: 300)
      @dish1.ingredients << @ingredient1
      @dish1.ingredients << @ingredient2
      @dish2 = @chef.dishes.create(name: "steak carrots", description: "Amazing")
      @ingredient1 = Ingredient.create!(name: "meat", calories: 400)
      @ingredient4 = Ingredient.create!(name: "carrots", calories: 200)
      @dish2.ingredients << @ingredient1
      @dish2.ingredients << @ingredient3
    end

    it 'I see the name of that chef and a link to its ingredients' do 
      visit "/chefs/#{@chef.id}"
      expect(page).to have_content("Name: #{@chef.name}")
      click_link "My ingredients"
      expect(current_path).to eq "/chefs/#{@chef.id}/ingredients"
      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@ingredient3.name}")
      expect(page).to_not have_content("#{@ingredient4.name}")
    end


  end

end

require 'rails_helper'

describe 'As a Visitor' do
	describe 'When I visit the contestants index page.' do
		before :each do
			@outfits = Challenge.create!(theme: "Trash Wear", project_budget: 350)
			@denim = @outfits.projects.create!(name: "Denim Trash Wear", material: "Denim")
			@pink = @outfits.projects.create!(name: "Pinky Due", material: "Satin")
			@glam = @outfits.projects.create!(name: "Glam Style", material: "Silk")
			@accessories = Challenge.create!(theme: "Using Accessories", project_budget: 200)
			@hat = @accessories.projects.create!(name: "Hat style", material: "Hat stuff")
			@shoe = @accessories.projects.create!(name: "Shoe styles", material: "shoe stuff")
			@holly = Contestant.create!(name: "Holly", age: 27, hometown: "Detroit", years_of_experience: 3)
			@nancy = Contestant.create!(name: "Nancy", age: 29, hometown: "Arvada", years_of_experience: 5)
			@sherry = Contestant.create!(name: "Sherry", age: 28, hometown: "Westminster", years_of_experience: 2)
			@tammi = Contestant.create!(name: "Tammi", age: 25, hometown: "Thornton", years_of_experience: 1)

			@holly.projects << @denim
			@holly.projects << @shoe

			@nancy.projects << @glam
			@nancy.projects << @hat
			@nancy.projects << @pink

			@sherry.projects << @pink
			@sherry.projects << @shoe

			@tammi.projects << @denim

			visit "/contestants"

		end

		it 'I see a list of names for each contestant' do

			expect(current_path).to eq("/contestants")

			expect(page).to have_content(@holly.name)
			expect(page).to have_content(@nancy.name)
			expect(page).to have_content(@sherry.name)
			expect(page).to have_content(@tammi.name)
		end

		it 'Under each contestant name I see a list of projects they have been on' do

			expect(current_path).to eq("/contestants")

			within "#contestant-#{@holly.id}" do
				expect(page).to have_content(@denim.name)
				expect(page).to have_content(@shoe.name)
			end

			within "#contestant-#{@nancy.id}" do
				expect(page).to have_content(@glam.name)
				expect(page).to have_content(@hat.name)
				expect(page).to have_content(@pink.name)
			end

			within "#contestant-#{@sherry.id}" do
				expect(page).to have_content(@pink.name)
				expect(page).to have_content(@shoe.name)
			end

			within "#contestant-#{@tammi.id}" do
				expect(page).to have_content(@denim.name)
			end
		end
	end
end

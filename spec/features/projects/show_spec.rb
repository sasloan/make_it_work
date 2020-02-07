require 'rails_helper'

describe 'As a Visitor' do
	describe 'When I visit a projects show page' do
		before :each do
			@outfits = Challenge.create!(theme: "Trash Wear", project_budget: 350)
			@denim = @outfits.projects.create!(name: "Denim Trash Wear", material: "Denim")
			@pink = @outfits.projects.create!(name: "Pinky Due", material: "Satin")
			@glam = @outfits.projects.create!(name: "Glam Style", material: "Silk")
			@accessories = Challenge.create!(theme: "Using Accessories", project_budget: 200)
			@hat = @accessories.projects.create!(name: "Hat style", material: "Hat stuff")
			@shoe = @accessories.projects.create!(name: "Shoe styles", material: "shoe stuff")
			@holly = Contestant.create!(name: "Holly", age: 38, hometown: "Detroit", years_of_experience: 3)
			@nancy = Contestant.create!(name: "Nancy", age: 29, hometown: "Arvada", years_of_experience: 5)
			@sherry = Contestant.create!(name: "Sherry", age: 28, hometown: "Westminster", years_of_experience: 2)
			@tammi = Contestant.create!(name: "Tammi", age: 18, hometown: "Thornton", years_of_experience: 1)

			@holly.projects << @denim
			@holly.projects << @shoe

			@nancy.projects << @glam
			@nancy.projects << @hat
			@nancy.projects << @pink

			@sherry.projects << @pink
			@sherry.projects << @shoe

			@tammi.projects << @denim
			@tammi.projects << @shoe
		end

		it 'I see the projects name and material' do

			visit "/projects/#{@denim.id}"

			expect(current_path).to eq("/projects/#{@denim.id}")

			expect(page).to have_content(@denim.name)
			expect(page).to have_content(@denim.material)
		end

		it 'I also see the theme of the challenge that this project belongs to' do

			visit "/projects/#{@denim.id}"

			expect(current_path).to eq("/projects/#{@denim.id}")

			expect(page).to have_content(@outfits.theme)
		end

		it "I can see a count of the contestants on this project" do

			visit "/projects/#{@denim.id}"

			expect(page).to have_content("Number of Contestants: 2")
		end

		it 'I can see the average years of experience for all the contestants involved' do

			visit "/projects/#{@shoe.id}"

			expect(page).to have_content("Average Contestant Experience: 28.0 years")
		end
	end
end

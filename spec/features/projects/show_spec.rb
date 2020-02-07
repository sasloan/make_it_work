require 'rails_helper'

describe 'As a Visitor' do
	describe 'When I visit a projects show page' do
		before :each do
			@outfits = Challenge.create!(theme: "Trash Wear", project_budget: 350)
			@denim = @outfits.projects.create!(name: "Denim Trash Wear", material: "Denim")
			@pink = @outfits.projects.create!(name: "Pinky Due", material: "Satin")
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
	end
end

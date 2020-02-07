require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

	describe "methods" do
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

		it '#contestant_count' do
			expect(@denim.contestants.contestant_count).to eq(2)
		end

		it '#average_age' do
			expect(@shoe.contestants.average_age).to eq(0.28e2)
		end
	end
end

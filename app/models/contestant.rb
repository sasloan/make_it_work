class Contestant <ApplicationRecord
	validates_presence_of :name, :age, :hometown, :years_of_experience

	has_many :contestant_projects
	has_many :projects, through: :contestant_projects

	def self.contestant_count
		count
	end

	def self.average_age
		average(:age)
	end
end

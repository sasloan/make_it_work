Rails.application.routes.draw do

	# Projects

	get "/projects/:project_id", to: "projects#show"

	# Contestants

	get "/contestants", to: "contestants#index"
end

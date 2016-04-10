Rails.application.routes.draw do
	resources :paintings, :exhibitions, :museums
	root "paintings#index"
end

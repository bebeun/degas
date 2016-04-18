Rails.application.routes.draw do
	resources :paintings, :exhibitions, :museums
	root "paintings#index"
	delete 'delete_picture', to: 'paintings#delete_picture'
end

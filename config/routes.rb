Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
	resources :paintings, :exhibitions, :museums
	root "paintings#index"
	delete 'delete_picture', to: 'paintings#delete_picture'
	get "search", to: 'paintings#search', as: :search
end

Rails.application.routes.draw do
  
  root 'landing#index'
  resources 'landing', only: [:index, :create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

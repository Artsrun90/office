Rails.application.routes.draw do
  
  get 'users/getAllUsers' => 'users#getAllUsers'
  resources :users

end

Rails.application.routes.draw do
  
  post 'user_token' => 'user_token#create'
  get 'users/getAllUsers' => 'users#getAllUsers'
  get 'GetAllUserTasks' => 'user_task#GetAllUserTasks'
  get 'getTasks/:id' => 'user_task#getTasks'
  resources :users
  resources :tasks

end

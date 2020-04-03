Rails.application.routes.draw do
  
  post 'user_token' => 'user_token#create'
  get 'users/getAllUsers' => 'users#getAllUsers'
  post 'users/createNewUser' => 'users#createNewUser'
  patch 'users/updateYourself/:id' => 'users#updateYourself'
  get 'GetAllUserTasks' => 'user_task#GetAllUserTasks'
  get 'getTasks/:userName' => 'user_task#getTasks'
  get 'roll/getRoleIdForAccount/:id' => 'roll#getRoleIdForAccount'
  delete 'destroyUserTask/:id' => 'user_task#destroyUserTask'
  resources :projects
  resources :users
  resources :tasks
  resources :roll
  resources :user_task

end

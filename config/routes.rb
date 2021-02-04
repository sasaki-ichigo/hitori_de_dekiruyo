Rails.application.routes.draw do
  get 'children/new'
  get 'tasks/index'
  devise_for :users
  root to: "tasks#index"
  resources :tasks, only: [ :show]
  resources :children, only: [:index, :new, :create, :show] do
  resources :tasks, only: [:new, :create, :edit, :update]
end
end

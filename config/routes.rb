Rails.application.routes.draw do
  devise_for :users

  root :to => 'todos#index'
  resources :todos do
    collection do
      get :active_todos
      get :completed_todos
    end
  end
end


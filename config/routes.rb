Todo::Application.routes.draw do
  resources :todo_lists

  devise_for :users

  namespace :user do
    root :to => "todo_list#index"
  end

  root :to => "static#index"
end

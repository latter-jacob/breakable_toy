Rails.application.routes.draw do
  root 'issues#index'
  devise_for :users

  resources :issues, only: [:index, :show, :new, :create, :destroy, :edit, :update]
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "alarms#index"

  resources :alarms, only: [:index, :new] do
  end
end



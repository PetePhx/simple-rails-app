Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :cats do
    # /cats/:cat_id/toys/:toy_id
    resources :toys, only: [:index]
  end

  # /toys/:toy_id
  resources :toys, only: [:show, :create, :update, :destroy]
end

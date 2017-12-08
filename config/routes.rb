Rails.application.routes.draw do

  resources :lists do
    resources :items do
      # add the "toggle" action to the items controller
      member do
        # action (put), name of action (:toggle)
        put :toggle
      end
    end
  end

  devise_for :users
  get 'welcome/index'

  # set root page
  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

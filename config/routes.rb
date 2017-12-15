Rails.application.routes.draw do

  get 'admin', to: 'admin#index', as: :admin
  get 'admin/promote/:id', to: 'admin#promote', as: :promote_admin

  resources :articles
  resources :lists do
    resources :items do
      # add the "toggle" action to the items controller
      member do
        # action (put), name of action (:toggle)
        put :toggle
      end
    end
  end

  # creates the user routes
  devise_for :users

  # create route for homepage
  get 'welcome/index'

  # create custom profile routes
  get('profile', to: 'profiles#show', as: :profile)




  # set root page
  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

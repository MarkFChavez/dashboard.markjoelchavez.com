Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  unauthenticated :user do
    devise_scope :user do
      root "devise/sessions#new"
    end
  end

  authenticated :user do
    root "dashboards#show"
    resource  :dashboard, only: [:show]
    resources :events, only: [:index, :create]
  end

end

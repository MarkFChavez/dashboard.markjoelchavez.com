Rails.application.routes.draw do
  default_url_options host: "http://localhost"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  unauthenticated :user do
    devise_scope :user do
      root "devise/sessions#new"
    end
  end

  authenticated :user do
    root "dashboards#show"

    # COMPONENTS
    resource :dashboard, only: [:show]
    resource :calendar,  only: [:show]

    resources :events, only: [:index, :create, :update, :destroy]
  end

end

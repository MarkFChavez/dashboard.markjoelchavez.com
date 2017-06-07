Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    devise_scope :user do
      root "devise/sessions#new"
    end
  end

  authenticated :user do

    root "dashboards#show"
    resource  :dashboard, only: [:show]
    resources :events, only: [:index]

  end

end

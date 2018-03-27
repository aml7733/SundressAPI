Rails.application.routes.draw do
  devise_scope :user do
    get "/users/auth/:provider/callback" => "users/omniauth_callbacks#create"
  end
  devise_for :users
  #, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#home"

end

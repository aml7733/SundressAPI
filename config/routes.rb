Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
   get "/auth/google_oauth2/callback", to: 'users/omniauth_callbacks#google'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#home"

end

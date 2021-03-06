Rails.application.routes.draw do
  root "addresses#index"

  devise_for :users, class_name: "FormUser",
    controllers: {omniauth_callbacks: "omniauth_callbacks",
                  registrations: "registrations"}

  devise_scope :user do
    get "/users/auth/:provider/upgrade" => "omniauth_callbacks#upgrade",
      as: :user_omniauth_upgrade
    get "/users/auth/:provider/setup", to: "omniauth_callbacks#setup"
  end

  resources :addresses
end

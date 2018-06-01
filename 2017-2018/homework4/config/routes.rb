Rails.application.routes.draw do
  devise_for :users
  resources :pages do
    resources :comments
  end

  root "pages#index"
end

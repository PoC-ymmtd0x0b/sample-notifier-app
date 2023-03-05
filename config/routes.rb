Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: %i[index show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

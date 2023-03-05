Rails.application.routes.draw do
  resources :announcements
  root 'users#index'
  devise_for :users
  resources :users, only: %i[index show]
  resources :reports
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

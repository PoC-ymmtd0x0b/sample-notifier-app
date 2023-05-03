Rails.application.routes.draw do
  root 'users#index'
  resources :notifications, only: %i[index show]
  resources :pages
  resources :announcements
  devise_for :users
  resources :users, only: %i[index show]
  resources :reports
  resources :practices
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

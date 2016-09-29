Rails.application.routes.draw do
  root to: 'home#index'

  resources :courses
  resources :students
  resources :classrooms, except: [:show]
end

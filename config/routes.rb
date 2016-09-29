Rails.application.routes.draw do
  root to: 'home#index'

  resources :courses, except: [:show]
  resources :students, except: [:show]
  resources :classrooms, except: [:show]
end

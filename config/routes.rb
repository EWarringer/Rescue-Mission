Rails.application.routes.draw do
  root 'question#index'
  resources :questions
end

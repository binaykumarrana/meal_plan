Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#show"

  resources :recipes
  resources :meal_plans
  resources :recipes do
  	put :favorite, on: :member
  end
end

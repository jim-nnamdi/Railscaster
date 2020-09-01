Rails.application.routes.draw do
  root :to => "entries#index"
  resources:entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  devise_for :users
  # in setting the root route { root :to => "controller#action" }
  
end

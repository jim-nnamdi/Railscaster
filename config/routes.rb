Rails.application.routes.draw do

  # in setting the root route { root :to => "controller#action" }
  
  root :to => "entries#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

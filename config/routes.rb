Rails.application.routes.draw do

  # in setting the root route { root :to => "controller#action" }

  root :to => "entries#index"
  resources:entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

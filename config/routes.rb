Rails.application.routes.draw do

  # in setting the root route { root :to => "controller#action" }

  root :to => "entries#index"
  get 'entries/new'
  get 'entries/show'
  post 'entries/create'
  patch 'entries/update'
  get 'entries/edit'
  get 'entries/delete'
  get 'entries/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

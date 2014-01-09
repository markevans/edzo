Edzo::Application.routes.draw do
  root :to => "home#index"

  resources :networks
  resources :people
  resources :relationships
  resources :person_tags
  resources :relationship_tags

  # get 'thumbs' => Dragonfly.app.endpoint { |params, app|
  #   app.fetch(params[:uid]).padded_resize(params[:geometry])
  # }

end

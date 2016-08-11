Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tags#index'

  post 'search', to: 'tags#search', as: 'search'

end

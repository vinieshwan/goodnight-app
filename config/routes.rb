Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :users do
    post '/:id/follow', to: 'users#follow'
    put '/:id/unfollow', to: 'users#unfollow'
  end
end

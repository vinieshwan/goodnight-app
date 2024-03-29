Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :profile do
    get '/bedtime_logs', to: 'profile#bedtime_logs'
    get '/following', to: 'profile#following'
  end

  scope :users do
    get '/bedtime_logs', to: 'users#bedtime_logs'

    post '/:id/follow', to: 'users#follow'
    post '/:id/unfollow', to: 'users#unfollow'
  end

  scope :bedtime do
    post '/in', to: 'bedtime#in'
    post '/out', to: 'bedtime#out'
  end
end

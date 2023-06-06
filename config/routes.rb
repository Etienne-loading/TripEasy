Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :blogs do
    resources :likes
    resources :steps do
      resources :tips
      resources :tags
    end
  end
  resources :profiles

  get '/my-library', to: 'pages#my_library' do
    resources :blogs, only: [create]
  end
end

Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'tags/new'
  get 'tags/create'
  get 'tags/edit'
  get 'tags/destroy'
  get 'tips/new'
  get 'tips/index'
  get 'tips/show'
  get 'tips/create'
  get 'tips/edit'
  get 'tips/destroy'
  get 'profiles/show'
  get 'trips/new'
  get 'trips/index'
  get 'trips/show'
  get 'trips/create'
  get 'trips/edit'
  get 'trips/destroy'
  get 'blogs/new'
  get 'blogs/index'
  get 'blogs/show'
  get 'blogs/create'
  get 'blogs/edit'
  get 'blogs/destroy'
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
end

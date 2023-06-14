Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :blogs do # index + show as traveler / new/create + edit/update + destroy as editor
    resources :likes, only: [:create] # as traveler
    #resources :steps, only: [:create] # as editor
  end

  # as traveler
  resources :users, only: [:show]

  # as editor
  resources :blogs do
    resources :steps do
      resources :tips, only: [:create, :destroy]
      resources :tag_list
    end
  end

  resources :tags, only: [:update, :destroy]

  get '/my-library', to: 'pages#my_library'
end


# resources :blogs
#   index + show as traveler
#   new/create + edit/update + destroy as editor

# resource :my_library, only: :show # /my_library

# ##

# resources :blogs, only: [:index, :show] as traveler

# namespace :my_library do
#   resources :blogs, only: [:index, :new, :create, ...] as editor
# end

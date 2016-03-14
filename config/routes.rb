Rails.application.routes.draw do
  root 'grumbles#new'
  resources :user_sessions
  resources :users do
    resources :grumbles, only: [:index]
  end
  resources :grumbles, only: [:show, :new, :create, :destroy] do
    resources :cheers, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :sympathies, only: [:create, :destroy]
    collection do
      get 'tag_name' => 'grumbles#tag_list', :as => :tagname
    end
  end

  resources :tags, only: [:index]
  resources :inquiry, only: [:index]
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end

Rails.application.routes.draw do

  devise_for :users

  resources :sororities

  resources :fraternities

  resources :universities, shallow: true do
    member do
      get 'discussion'
      get 'fraternities'
      get 'sororities'
    end

    resources :topic, only: [:show, :create] do
      post 'create_topic_reply'
      post 'create_post_reply'
    end
    
    resources :fraternity_chapter, only: [:show] do
      resources :ratings, only: [:new, :create]
    end

    resources :sorority_chapter, only: [:show] do
      resources :ratings, only: [:new, :create]
    end
  end

  get 'welcome/index'

  root 'welcome#index'
end

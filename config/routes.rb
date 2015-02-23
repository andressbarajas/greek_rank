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

    resources :topic, except: [:index, :update] do
      delete 'delete_post'
      post 'create_topic_reply'
      post 'create_post_reply'
    end
    
    resources :fraternity_chapters, except: [:index] do
      resources :ratings, only: [:new, :create, :destroy]
    end

    resources :sorority_chapters, except: [:index] do
      resources :ratings, only: [:new, :create, :destroy]
    end

    collection do
      get 'search'
    end
  end

  # Articles
  get '/testing/' => 'application#testing'

  get 'welcome/index'
  get 'welcome/new_article'
  post 'welcome/create_article'

  root 'welcome#index'
end

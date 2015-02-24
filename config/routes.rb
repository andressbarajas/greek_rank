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
  get '/lorem_ipsum/' => 'application#lorem_ipsum'
  get '/bacon_ipsum/' => 'application#bacon_ipsum'
  get '/hipster_ipsum/' => 'application#hipster_ipsum'
  get '/gangsta_ipsum/' => 'application#gangsta_ipsum'

  resources :welcome

  root 'welcome#index'
end

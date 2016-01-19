Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books do
    member do
      get "like", to: "books#upvote"
      get "dislike", to: "books#downvote"
    end
    resources :comments
  end
  resources :comments do
    member do
      get "like", to: "comments#upvote"
      get "dislike", to: "comments#downvote"
    end
  end
end

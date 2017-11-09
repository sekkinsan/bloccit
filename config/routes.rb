Rails.application.routes.draw do

#call resources method and pass it a Symbol, instructs RAils to create post routes for creating, updating
#viewing, and deleting instances of post
resources :topics do
  resources :posts, except: [:index]
end

resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote
end

#create routes for new and create actions, using hash key to prevent Rails from creating unnecessary routes
resources :users, only: [:new, :create, :show]
post 'users/confirm' => 'users#confirm'

resources :sessions, only: [:new, :create, :destroy]

resources :advertisements
resources :questions

#remove get "welcome/index" because we've declared the index view as root, and modify the about route to allow
#users to visit /about, rather than /welcome/about
get 'about' => 'welcome#about'

get 'welcome/contact'

get 'welcome/faq'

  root 'welcome#index' #makes default page be the welcome index view

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

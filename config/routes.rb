Rails.application.routes.draw do

#call resources method and pass it a Symbol, instructs RAils to create post routes for creating, updating
#viewing, and deleting instances of post
resources :posts

#remove get "welcome/index" because we've declared the index view as root, and modify the about route to allow
#users to visit /about, rather than /welcome/about
get 'about' => 'welcome#about'

#  get 'welcome/contact'

#  get 'welcome/faq'

  root 'welcome#index' #makes default page be the welcome index view

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

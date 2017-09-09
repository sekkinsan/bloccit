Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  root 'welcome#index' #makes default page be the welcome index view

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

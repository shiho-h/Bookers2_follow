Rails.application.routes.draw do

root 'homes#top'


  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }




resources :users, only: [:show]
end

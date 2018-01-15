Rails.application.routes.draw do
    root 'welcome#hello'
    get 'signin', to: 'sessions#new'
    post 'signin', to: 'sessions#create'
    resources :users

end
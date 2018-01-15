Rails.application.routes.draw do
    get '/', to: 'welcome#hello'
    resources :users

end
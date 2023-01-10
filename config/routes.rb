Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'api/v1/welcome', to: 'welcome#index'
  get 'api/v1', to: 'welcome#index'
  root to: 'welcome#index'
end

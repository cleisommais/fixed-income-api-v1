Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope path: 'api/v1' do
    devise_for :users
    get :welcome, to: 'welcome#index'
  end
  root to: 'welcome#index'
end

SwiftypeIntegrationDemo::Application.routes.draw do
  resources :posts, :except => :index
  match '/search' => 'search#search'
  root :to => 'posts#index'
end

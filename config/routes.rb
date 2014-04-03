SwiftypeIntegrationDemo::Application.routes.draw do
  resources :posts, :except => :index
  match '/search' => 'search#search', :via => [ :get, :post ]
  root :to => 'posts#index'
end

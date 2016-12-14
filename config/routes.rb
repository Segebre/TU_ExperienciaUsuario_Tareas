SuperBook::Application.routes.draw do

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"


  resources :posts do
    resources :comments, :except => [:index, :show]
  end
  resources :memberships, except: :show
  #resources :characters, :except => [:index, :show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get '/characters/:id/posts' => 'characters#posts', as: 'character_posts'
  get '/memberships/:id/characters' => 'memberships#characters', as: 'membership_characters'

  get    '/profile' => 'characters#show', as: :character
  post   '/characters', to: 'characters#create'
  get    '/characters/new', to: 'characters#new', as: :new_character
  get    '/characters/:id/edit', to: 'characters#edit', as: :edit_character
  patch  '/characters/:id', to: 'characters#update'
  put    '/characters/:id', to: 'characters#update'
  delete '/characters/:id', to: 'characters#destroy'

  #get '/characters/memberships/:id/characters' => 'memberships#characters'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

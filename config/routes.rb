Kattyfashion::Application.routes.draw do
  resources :reviews
  resources :pages
  resources :portfolios
  get "portfolios/:id/:slug", to: "portfolios#show", as: :portfolio_entry

  devise_for :users

  root to: "pages#index"


  namespace :admin do
    root to: "dashboard#show"
    get 'dashboard', to: "dashboard#show"

    devise_scope :user do
      get 'register', to: "registrations#new", as: :register
      get 'login', to: "sessions#new", as: :login
      post 'login', to: "sessions#new", as: :login_post
      get 'logout', to: "sessions#destroy", as: :logout
    end

    resources :reviews do
      get "approve", on: :collection
      get "disapprove", on: :collection
      get "delete", on: :collection
    end

    resources :portfolios
    resources :images do
      get "fetch", on: :member
      post "update_info", on: :member
    end
    
    post "portfolios/create", to: "portfolios#create"
  end


  get ":page", controller: :pages, action: :show, as: :mypage


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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

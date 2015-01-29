Cwapp::Application.routes.draw do
  root :controller => 'static', :action => '/'
  devise_for :users, controllers: {registrations: "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, except: [:show] do
    resources :personal_details
    resources :workouts, only: [:index, :new, :create, :show, :edit]
    resources :initial_test do
      resources :build, controller: 'initial_test/build'
    end
  end
  get 'users/:id/view_profile' => 'users#view_profile', as: :user_view_profile
  get 'users/about_yourself' => 'users#about_yourself', as: :user_introduction

  resources :workouts, only:[:edit] do
    resources :exercises
    end

  get 'users/dashboard' => 'users#index', :as => :user_dashboard
  delete 'workouts/delete/:id' => 'workouts#destroy', :as => :delete_workout

  get "/pages/*id" => 'pages#show', as: :page, format: false

  # You can have the root of your site routed with "root"

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

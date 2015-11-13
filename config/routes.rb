Rails.application.routes.draw do


  get 'pages/my_profile', as: :my_profile
  get 'bookings/show_for_resto/:params',to: 'bookings#show_for_resto', as: :place_books
  get 'bookings/oncomming_books/:params',to: 'bookings#oncomming_books', as: :oncomming_books
  get 'bookings/acc_booking/:id/:restaurant_comment',to: 'bookings#acc_booking', as: :acc_booking
  get 'bookings/reject_booking/:id/:restaurant_comment',to: 'bookings#reject_booking', as: :reject_booking

  get 'pages/establishment_home_porfile', as: :my_establishment_profile
  get '/search', to: 'pages#search'


  root 'pages#home'

  devise_for :restaurants
  devise_for :users

  resources :restaurants, only: [:show, :index] do
    resources :bookings
  end
  resources :reviews, only: [:index, :create, :destroy]


  get "restaurant/edit"
  patch "restaurant/update"
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

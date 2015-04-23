Rails.application.routes.draw do

  resources :book_marks

  resources :skills

  resources :messages

  mount Ckeditor::Engine => '/ckeditor'
  resources :locations

  resources :organize_data

  get 'others/index'

  resources :rating_users

  resources :rating_posts


  resources :important_points

  resources :form2s

  resources :form1s

  resources :contacts

  get 'parameterize_form/index'

  get 'notes/index'

  get 'sign_up_user/index'
  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }
  resources :user
  # devise_for :users
  resources :enumerations

  get 'default/index'

  resources :projects

  ############################### ROUTES EXAMPLES ####################################################
  # get 'billings', to: 'billings#index'
  # get '/billings/:id', to: 'billings#show', as: 'billing'
  # delete '/billings/:id', to: 'billings#destroy', as: 'billing_destroy'
  resources :billings
  get 'switch_task_completed' => 'billings#switch_task_completed'
  ############################### END ROUTES EXAMPLES ################################################

  get 'search', to: 'search#search'

  resources :employees

  resources :cocoon_examples

  resources :tagging_select_tos

  resources :calendars do
    collection { post :import }
  end

  resources :quotes

  resources :events
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'default#index'

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

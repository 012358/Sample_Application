Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :friendships,:book_marks,:skills,:messages,:emplyees ,:locations,:organize_data, :rating_users,:rating_posts ,
            :important_points ,:form2s ,:form1s ,:contacts ,:employees ,:cocoon_examples ,:tagging_select_tos ,:user ,:enumerations,
            :projects ,:quotes ,:events
  get 'others/index'
  get 'parameterize_form/index'
  get 'notes/index'
  get 'sign_up_user/index'
  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }
  get 'default/index'
  get 'default/book_marks_list'
  ############################### ROUTES EXAMPLES ####################################################
  # get 'billings', to: 'billings#index'
  # get '/billings/:id', to: 'billings#show', as: 'billing'
  # delete '/billings/:id', to: 'billings#destroy', as: 'billing_destroy'
  resources :billings
  get 'switch_task_completed' => 'billings#switch_task_completed'
  get 'switch_event_completed' => 'events#switch_event_completed'
  ############################### END ROUTES EXAMPLES ################################################
  get 'search', to: 'search#search'
  resources :calendars do
    collection { post :import }
  end
  ##################################
  get 'all_calendars', to: 'calendars#index'
  get 'calendars/:id', to: 'calendar#show', as: 'showme_last_calendar'
  get 'calendars/:id/edit', to: 'calendar#edit', as: 'last_calendar_toupdate'
  root 'default#index'
end

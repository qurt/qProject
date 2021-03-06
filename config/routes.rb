MyApp::Application.routes.draw do
  resources :stages
  match '/update_stages' => 'tasks#update_stages'

  controller :login do
    get 'login' => :new
    post 'login' => :create
    delete 'login' => :destroy
  end

  get 'feed/index'
  get 'feed', to: 'feed#index'
  get '/refresh', to: 'feed#refresh'
  get '/render_task', to: 'feed#render_task'
  post 'subtasks', to: 'subtasks#index'
  get '/tasks/new/:project_id', to: 'tasks#new'

  get '/tasks/check', to: 'tasks#check'
  resources :tasks
  get '/tasks/complete/:id', to: 'tasks#complete'
  get '/tasks/ready/:id', to: 'tasks#ready'

  resources :projects
  get '/user_field', to: 'users#user_field'


  resources :users


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'feed#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

Rails.application.routes.draw do

  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'

  get 'access/login'

  post 'access/attempt_login'

  get 'access/logout'

  get 'example/index'

  get 'example/show'

  resources :admin_users, except: [:show] do

    member do
      get :delete
    end
  end

  resources :subjects do

    member do
      get :delete
    end
  end

  resources :pages do

    member do
      get :delete
    end
  end
  resources :sections do

    member do
      get :delete
    end
  end
  # get 'demo/index'
# default route may go away in future
  # get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :trades, only: [:index, :create, :show] do
    delete '/:id', :to => "trades#delete", :as => "delete", :on => :collection
    put '/:id', :to => "trades#update", :as => "update", :on => :collection
    patch '/:id', :to => "trades#update", :as => "update_patch", :on => :collection
  end
end

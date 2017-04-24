Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      match 'boomerangs/get_records', controller: 'boomerangs', :via => :get, defaults: {format: :json}
    end
  end

  resources :boomerangs, except: [:destroy, :show]
  match 'boomerangs/boompost' => 'boomerangs#boompost', :via => [:get, :post]
  match 'mystatus' => 'boomerangs#mystatus', :via => :get
  match 'stats' => 'boomerangs#stats', :via => :get, :as => 'stats'
  match 'boomerangs/viahost_setup' => 'boomerangs#viahost_setup', :via => :get

  root 'boomerangs#stats'

end

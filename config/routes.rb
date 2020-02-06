Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  resources :dokuments do
    collection do
        post ':id/addKorisnik', :to =>  'dokuments#addKorisnik', :as => :addKorisnik

    end
    resource :izmenas do
      collection do
        post "rollback", :to=> 'izmenas#rollback', :as => :rollback
      end
    end
  end

  resources :users do
    collection do
      delete "obrisiUsera", :to=> 'users#obrisi', :as => :obrisi
      post "makeAdmin", :to=> 'users#makeAdmin', :as => :makeAdmin

    end
  end



  root "posts#index"

end

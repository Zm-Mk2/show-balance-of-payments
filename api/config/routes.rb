Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :incomedatas do
    #delete 'destroy_all'
    #collection {post :import}
    collection do
      post 'import'
      delete 'destroy_all'
    end
  end
end

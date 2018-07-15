Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  namespace :ext do
    namespace :api do
      namespace :v1 do
        resources :products
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

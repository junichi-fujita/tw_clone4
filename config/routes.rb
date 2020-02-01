Rails.application.routes.draw do
  resources :tweets do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
end

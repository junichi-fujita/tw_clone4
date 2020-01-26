Rails.application.routes.draw do
  resources :tops do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
end

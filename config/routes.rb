Rails.application.routes.draw do
  resources :tops do
    collection do
      post :confirm
    end
  end
end

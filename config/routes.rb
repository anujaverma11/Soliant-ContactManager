Rails.application.routes.draw do
  resources :contacts do
    collection { post :import }
  end

  root to: "contacts#index"
end

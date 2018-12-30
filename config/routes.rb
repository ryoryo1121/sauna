Rails.application.routes.draw do
  get 'entry_images/index'
  get 'entry_images/new'
  get 'entry_images/edit'
  root "top#index"
  get "about" => "top#about", as: "about"

  resources :members , only: [:index, :show] do
    get "search", on: :collection
    resources :entries, only: [:index]
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]

  resources :articles, only: [:index, :show]
  resources :entries do
    patch "like", "unlike", on: :member
    get "voted", on: :collection
    resources :images, controller: "entry_images" do
      patch :move_igher, :move_lower, on: :member
    end
  end

  namespace :admin do
    root "top#index"
    resources :members do
      get "search", on: :collection
    end
    resources :articles
  end
end

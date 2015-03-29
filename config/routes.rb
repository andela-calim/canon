Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # get 'questions/new', to: 'questions#new', as: :question_new

  resources :comments, only: [:new, :create, :index]
  resources :questions do
    member do
      post :up_vote, :down_vote
    end

    collection do
      post :search
    end
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :admin, only: :index

  get 'roles/edit/:id', to: 'roles#edit_roles', as: :edit_roles
  put 'roles/update', to: 'roles#update_roles', as: :update_roles

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'login', to: 'home#login'

  root "home#index"

end

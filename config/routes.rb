Rails.application.routes.draw do
  root 'welcome#index'

  resources :posts do
    resources :comments, only: [:create, :destroy, :index]
    resources :likes, only: [:create]
  end



  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
    #get rid of ":id" in the url
  end


end

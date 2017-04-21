Rails.application.routes.draw do
  # get 'password_resets/new'
  #
  # get 'password_resets/edit'

  root 'welcome#index'
  get('/change_password', {to:'users#edit_password'})
  put('/change_password', {to:'users#update_password'})

  resources :posts do
    resources :comments, only: [:create, :destroy, :index]
    resources :likes, only: [:create]
  end



  resources :users, only:[:index, :new, :create, :update, :edit]
  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
    #get rid of ":id" in the url
  end
  resources :password_resets, only: [:new, :create, :edit, :update]


end

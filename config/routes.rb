Rails.application.routes.draw do
  root "campaigns#index"
  devise_for :users, :controllers => {
    registrations: 'registrations'
}

  

  concern :commentable do
    resources :comments
  end

  resources :campaigns, concerns: :commentable do
    resources :todos
    resources :topics, concerns: :commentable
  end

  resources :experts,:novices



  

end

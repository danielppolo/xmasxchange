Rails.application.routes.draw do
  resources :exchanges, only: [:index, :show, :create, :update] do
    get '/sort', action: :sort, controller: 'exchanges'
    resources :people, only:[:create]
  end
  resources :people, only:[:show] do
    resources :gifts, only:[:create]
  end
  get 'people/:id/:key', to: 'people#peer', as: 'peer'
  root 'exchanges#index'
end


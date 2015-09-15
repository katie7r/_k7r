Rails.application.routes.draw do
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', unlock: 'unlock' }

  root 'static#home'

  # get 'my/bio'  => 'static#about'
  # get 'my/work' => 'static#portfolio'

  resources :laughs, except: [:show, :destroy]
  get '/laughs/unpublished', to: 'laughs#index', as: :unpublished_laughs, defaults: { unpublished: true }

  resources :tidbits, except: [:show, :destroy]
  resources :tidbits, only: [] do # :(
    collection do
      get '/unpublished/:category', to: 'tidbits#index', as: :unpublished_categorized, defaults: { unpublished: true }
      get '/unpublished',           to: 'tidbits#index', as: :unpublished,             defaults: { unpublished: true }
      get '/:category',             to: 'tidbits#index', as: :categorized
    end
  end

end

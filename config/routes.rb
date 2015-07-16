Rails.application.routes.draw do
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', unlock: 'unlock' }

  root 'static#home'

  get 'my/work'   => 'static#portfolio'

  resources :tidbits, except: [:show, :destroy]
  get 'tidbits/:category', to: 'tidbits#index', as: :category_tidbits

end

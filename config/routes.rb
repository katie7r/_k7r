Rails.application.routes.draw do
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', unlock: 'unlock' }

  root 'static#home'

  get 'my/bio'    => 'static#about'
  get 'my/resume' => 'static#resume'
  get 'my/work'   => 'static#portfolio'

  resources :tidbits, except: :show
  get 'tidbits/:category', to: 'tidbits#index', as: :category_tidbits

end

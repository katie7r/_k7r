Rails.application.routes.draw do
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', unlock: 'unlock' }

  root 'static#home'

  get 'my/bio'    => 'static#about'
  get 'my/resume' => 'static#resume'

end

Rails.application.routes.draw do

  devise_for :admins
  root 'static#home'

  get 'about'  => 'static#about'
  get 'resume' => 'static#resume'

end

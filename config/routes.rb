Rails.application.routes.draw do

   #ネームスペースadminsのルート制御
  namespace :admins do
    # devise_for :admin_users, controllers: {
      #各usersフォルダ内のコントローラ指定
      #sessions: 'admin_users/sessions',
      #registrations: 'admin_users/registrations',
      #passwords: 'admin_users/passwords' 
    #}
    resources :events
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #ネームスペースpublicsのルート制御
  namespace :publics do
    devise_for :users, controllers: {
      #各usersフォルダ内のコントローラ指定
      sessions: 'publics/users/sessions',
      registrations: 'publics/users/registrations',
      passwords: 'publics/users/passwords'
    }
    resources :events
  end
  post 'publics/users/sign_up' => 'publics/users/registrations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to:'homes#top'
    #get 'home/about' => 'homes#about'
end

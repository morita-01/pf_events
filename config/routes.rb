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
  #devise_for :users, controllers: {
  #  sessions: 'publics/users/sessions',
  #  registrations: 'publics/users/registrations',
  #  passwords: 'publics/users/passwords'
  #}
  

  #deviseはnamespaceで記載しない、階層を定義したらscopeで定義すること
  
  scope '/publics' do
     devise_for :users, controllers: {
      #各usersフォルダ内のコントローラ指定
      sessions: 'publics/users/sessions',
      registrations: 'publics/users/registrations',
      passwords: 'publics/users/passwords'
    }   
  end
    
  namespace :publics do
    resources :users, only:[:show,:edit,:update]
    
    resources :events, only:[:index, :show, :new, :edit, :create, :update] do
      resource :favorites, only:[:create, :destroy]
    end
  end
  
  #devise_scope :user do
  #  get 'publics/users/sign_up', to: 'publics/users/registrations#new'
  #  post 'publics/users/sign_up', to: 'publics/users/registrations#create', as: :publics_user_registration
  #end
  #post 'publics/users' => 'publics/registrations#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to:'homes#top'
    #get 'home/about' => 'homes#about'
end

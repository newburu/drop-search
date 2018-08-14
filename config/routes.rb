Rails.application.routes.draw do
  resources :server_kinds
  resources :site_kinds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }

  root 'portals#index'

  get '/portals', to: 'portals#index'
  get '/mypage', to: 'portals#mypage'

  # 静的ページ
  get 'static_pages/info'
  get 'static_pages/update'

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: 'external' do
    get :landing
    get :version
  end

  resources :moves do
    member do
      post :practiced_today
    end
  end

  resources :tags

  devise_for :users, path_names: { sign_up: 'join',
                                   sign_in: 'login',
                                   sign_out: 'logout' },
                     path: ''

  root to: 'external#landing'

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

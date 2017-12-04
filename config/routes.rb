# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events, except: %i[new edit]
  resources :bicycles, except: %i[new edit show]
  get '/bicycles/mine' => 'bicycles#mine'
  get '/bicycles/stolen' => 'bicycles#stolen'
  delete '/bicycles/recover/:id' => 'bicycles#recover'
  resources :examples, except: %i[new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]
end

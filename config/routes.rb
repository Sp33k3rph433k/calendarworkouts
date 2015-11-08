require 'api_constraints'
Cwapp::Application.routes.draw do
  root :controller => 'static', :action => '/'
  devise_for :users, controllers: {registrations: "registrations"}

  resources :users, except: [:show] do
    resources :personal_details
    resources :workouts, only: [:index, :new, :create, :show, :edit]
    resources :initial_test do
      resources :build, controller: 'initial_test/build'
    end
  end

  resources :workouts, only:[:edit] do
    resources :exercises
    end
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

    end
  end


end

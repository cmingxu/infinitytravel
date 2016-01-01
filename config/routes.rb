# -*- encoding : utf-8 -*-
Infinitytravel::Application.routes.draw do
  get "setting" => "users#setting"
  put "update_setting" => "users#setting"
  put "update_password" => "users#update_password"
  resources :users, only: [:index] do
    get :home, on: :collection
    member do
      get :dianpins
      get :bookings
      get :questions
    end
  end

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

    devise_scope :user do
      get "sign_in", to: "users/sessions#new"
      get "login", to: "users/sessions#new"
      post "login", to: "users/sessions#create"
      get "signup", to: "users/registrations#new"
      post "signup", to: "users/registrations#create"
      delete "signout", to: "users/sessions#destroy"
    end
  end
  get "travel_pages/index"

  resources :customizebookings
  resources :photocontests
  resources :gbookingdays
  resources :dianpins
  resources :questions
  resources :galleries
  resources :gbookings
  resources :bookings
  resources :brochure_destinations
  resources :brochure_interests
  resources :brochure_travels
  resources :brochures
  resources :pages
  resources :presses
  resources :events
  resources :photos
  resources :cities

  resources :travels do 
    resources :itineraries
    resources :datesprices
  end

  resources :destinations do
    resources :travels
  end

  resources :interests do
    resources :travels
  end

  resources :specialoffers

  resources :itineraries
  resources :datesprices

  namespace :admin do
    resources :users do
      member do
        get :lock, :unlock, :generate_new_password_email
      end
    end
    resources :travels do 
      member do
        get :new_destination_travel
        post :create_destination_travel
        get :new_interest_travel
        post :create_interest_travel
        get :new_specialoffer_travel
        post :create_specialoffer_travel
        get :new_brochure_travel
        post :create_brochure_travel
      end
      resources :itineraries
      resources :datesprices
      resources :travel_pages do
        collection do
          put :assign
        end

        member do
          delete :detach
        end
      end
    end
    resources :datesprices
    resources :itineraries
    resources :destinations do
      resources :galleries
      member do
        get :new_brochure_destination
        post :create_brochure_destination
      end
    end
    resources :interests do
      member do
        get :new_brochure_interest
        post :create_brochure_interest
      end
    end
    resources :hotels do
      resources :galleries
    end
    resources :photos
    resources :specialoffers
    resources :presses
    resources :events
    resources :pages
    resources :banners
    resources :brochures
    resources :galleries do 
      resources :photos
    end
    resources :bookings
    resources :gbookings
    resources :questions
    resources :cities
    resources :photocontests
    resources :dianpins
    resources :shouyes
  end

  get "weibo_login" => "welcome#weibo_login"
  get "weibo_callback" => "welcome#weibo_callback"

  get "admin/travels/:id/destroy_destination_travel/:destination_id" => "admin/travels#destroy_destination_travel"
  get "admin/travels/:id/destroy_interest_travel/:interest_id" => "admin/travels#destroy_interest_travel"
  get "admin/travels/:id/destroy_specialoffer_travel/:specialoffer_id" => "admin/travels#destroy_specialoffer_travel"
  get "admin/travels/:id/destroy_brochure_travel/:brochure_id" => "admin/travels#destroy_brochure_travel"
  get "admin/interests/:id/destroy_brochure_interest/:brochure_id" => "admin/interests#destroy_brochure_interest"
  get "admin/destinations/:id/destroy_brochure_destination/:brochure_id" => "admin/destinations#destroy_brochure_destination"
  get 'admin' => 'admin/base#index'
  get 'admin/handle' => 'admin/base#handle'
  get 'search' => 'welcome#search'
  get 'travel_count' => 'welcome#travel_count'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

end

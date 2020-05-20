BeecashEvents::Application.routes.draw do

  devise_scope :user do
    get "/signup" => "registrations#new", as: "new_user_registration"
  end

  devise_for :users, controllers: { registrations: "registrations" }

  resources :users

  root 'events#index'

  resources :events, only: [:index, :show] do
    member do
      post '/participant' => "event_participants#create", as: "create_participant"
      delete '/participant' => "event_participants#delete", as: "delete_participant"
    end
  end

end

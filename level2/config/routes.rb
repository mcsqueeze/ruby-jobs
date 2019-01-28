Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do#, defaults: { format: :json }  do # added default format
    resources :communications, only: [:create, :index]
  end

end

Rails.application.routes.draw do
  devise_for :users
   root to: 'static_pages#index'
   namespace :control_panel do
   	resources :boards
   end

end

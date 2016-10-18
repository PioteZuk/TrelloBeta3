Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
   root to: 'static_pages#index'
   namespace :control_panel do
   	resources :invitations, only: [] do
   		resource :submit, controller: :submit_invitations, only: :update
         resource :reject, controller: :reject_invitations, only: :update
      end
   	resources :users do
   		resources :invitations
   	end
      resources :boards do
         resources :stories, only: [:create, :edit, :update, :destroy]
         # resources :comments, only: [:create, :edit, :update, :destroy]
      end
      resources :stories, only: [] do
         resources :comments, only: [:create, :edit, :update, :destroy]
      end
   end # namespace :control_panel

end

Rails.application.routes.draw do
  resources :conditions
  resources :applicants
  get 'applicants/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :programs do
      resources :versions do
        resources :postulations do
          resources :tasks do
          end
         collection do
          get 'show_web'
          end
        end
      end
    end
  end


resources :programs
resources :postulations do
  collection do
    get 'final_step'
  end
end
resources :postulation_details
root 'statics#index'

end

Rails.application.routes.draw do
  resources :conditions

  get 'applicants/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :applicants, controllers: { sessions: "applicants/sessions", registrations: "applicants/registrations" }## aca se agregan los controladores que se modificaron, 

  namespace :admin do
    resources :programs do
      resources :versions do
        resources :postulations do
         collection do
          get 'show_web'
        end
      end
    end
  end
end

resources :applicants
resources :programs
resources :postulations do
  collection do
    get 'final_step'
  end
end
resources :postulation_details
root 'statics#index'

end

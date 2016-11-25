Rails.application.routes.draw do
  scope :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'custom/registrations',
        sessions: 'custom/sessions',
        passwords: 'custom/passwords',
        token_validations: 'custom/token_validations',
        omniauth_callbacks: 'custom/omniauth_callbacks'
    }

    resources :events, only: [:index, :show]
    resources :users, only: [:show, :update] do
      resource :events, only: [:create, :destroy]
    end
  end
end

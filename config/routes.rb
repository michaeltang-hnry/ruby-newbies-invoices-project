Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "invoices#index"

  resources :invoices, only: [ :index, :new, :create, :show ], param: :identifier
end

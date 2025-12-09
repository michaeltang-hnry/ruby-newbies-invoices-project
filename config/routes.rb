Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :invoices, only: [:index, :new, :create, :show], param: :identifier
end

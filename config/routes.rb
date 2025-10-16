Rails.application.routes.draw do
  resources :status_empresas
  root 'home#index'
  get 'home/index'
  
  # Rotas Scaffold
  resources :distritos
  resources :bairros
  resources :municipios
  resources :estados
  resources :paises
  resources :unidades_medida

  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end

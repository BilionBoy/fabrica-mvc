Rails.application.routes.draw do
  resources :entradas_estoque
  resources :produtos
  resources :categoria_produtos
  resources :tipo_usuarios
  resources :filiais
  root 'home#index'
  get 'home/index'
  
  # Rotas Scaffold
  resources :distritos
  resources :bairros
  resources :municipios
  resources :estados
  resources :paises
  resources :unidades_medida
  resources :status_empresas
  resources :empresas

  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end

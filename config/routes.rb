Rails.application.routes.draw do
  root 'kanban#index'
  get 'home/index'

  resources :saida_estoques
  resources :entradas_estoque
  resources :produtos
  resources :categoria_produtos
  resources :tipo_usuarios
  resources :filiais
  resources :clientes do 
    get :search, on: :collection
  end
  resources :ordem_servicos
  
  # Rotas Scaffold
  resources :distritos
  resources :bairros
  resources :municipios
  resources :estados
  resources :paises
  resources :unidades_medida
  resources :status_empresas
  resources :empresas

  resources :tasks, only: [:new, :create, :update]
  resources :columns, only: [:index]
end

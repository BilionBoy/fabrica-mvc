# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'pais',              'paises'
  inflect.irregular 'estado',            'estados'
  inflect.irregular 'municipio',         'municipios'
  inflect.irregular 'bairro',            'bairros'
  inflect.irregular 'distrito',          'distritos'
  inflect.irregular 'status_empresa',    "status_empresas"
  inflect.irregular 'empresa',           'empresas'
  inflect.irregular 'filial',            'filiais'
  inflect.irregular 'categoria_produto', 'categorias_produtos'
  inflect.irregular 'produto',           'produtos'
  inflect.irregular 'unidade_medida',    'unidades_medida'
  inflect.irregular 'entrada_estoque',   'entradas_estoque'
  inflect.irregular 'tipo_usuario',      'tipo_usuarios'
end

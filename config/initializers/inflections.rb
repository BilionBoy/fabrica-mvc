# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'pais', 'paises'
  inflect.irregular 'estado', 'estados'
  inflect.irregular 'municipio', 'municipios'
  inflect.irregular 'bairro',    'bairros'
  inflect.irregular 'distrito',    'distritos'
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'produto', 'produtos'
  inflect.irregular 'unidade_medida', 'unidades_medida'
end

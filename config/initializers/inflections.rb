# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'produto', 'produtos'
  inflect.irregular 'unidade_medida', 'unidades_medida'
end

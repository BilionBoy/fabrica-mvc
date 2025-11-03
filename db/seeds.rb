# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create the 4 status columns
columns_data = [
  { title: 'Agendados', position: 1 },
  { title: 'Planejado', position: 2 },
  { title: 'Em Atendimento', position: 3 },
  { title: 'Concluído', position: 4 }
]

columns_data.each do |col_data|
  Column.find_or_create_by(title: col_data[:title]) do |col|
    col.position = col_data[:position]
  end
end

# Create sample tasks for each column
Column.find_by(title: 'Agendados')&.tasks.find_or_create_by(title: 'Reunião com cliente') do |task|
  task.description = 'Reunião agendada para discussão dos requisitos do projeto'
  task.status = :agendado
end

Column.find_by(title: 'Planejado')&.tasks.find_or_create_by(title: 'Design de interface') do |task|
  task.description = 'Criar mockups e wireframes para a aplicação'
  task.status = :planejado
end

Column.find_by(title: 'Em Atendimento')&.tasks.find_or_create_by(title: 'Desenvolvimento backend') do |task|
  task.description = 'Implementar APIs e lógica de negócio'
  task.status = :em_atendimento
end

Column.find_by(title: 'Concluído')&.tasks.find_or_create_by(title: 'Setup do servidor') do |task|
  task.description = 'Servidor produção configurado e online'
  task.status = :concluido
end

puts "✓ Kanban board initialized with 4 columns and sample tasks"

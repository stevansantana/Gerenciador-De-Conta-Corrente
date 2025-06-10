# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Correntista.create!([
#   {
#     nome: 'Stevan Normal',
#     conta_corrente: '12345',
#     senha: '1234',
#     perfil: 'Normal',
#     saldo: 1000.0
#   },
#   {
#     nome: 'Stevan VIP',
#     conta_corrente: '54321',
#     senha: '4321',
#     perfil: 'VIP',
#     saldo: 5000.0
#   }
# ])

# c1 = Correntista.find_by(conta_corrente: '12345')
# c1.transacoes.create!(tipo: 'Depósito', descricao: 'Depósito inicial', valor: 1000)

# c2 = Correntista.find_by(conta_corrente: '54321')
# c2.transacoes.create!(tipo: 'Depósito', descricao: 'Depósito inicial', valor: 5000)

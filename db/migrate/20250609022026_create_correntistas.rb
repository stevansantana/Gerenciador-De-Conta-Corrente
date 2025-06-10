class CreateCorrentistas < ActiveRecord::Migration[8.0]
  def change
    create_table :correntistas do |t|
      t.string :nome
      t.string :conta_corrente
      t.string :senha
      t.string :perfil
      t.decimal :saldo

      t.timestamps
    end
  end
end

class CreateTransacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :transacaos do |t|
      t.references :correntista, null: false, foreign_key: true
      t.string :tipo
      t.string :descricao
      t.decimal :valor

      t.timestamps
    end
  end
end

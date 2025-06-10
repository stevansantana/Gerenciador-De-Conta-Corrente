class CreateVisitaGerentes < ActiveRecord::Migration[8.0]
  def change
    create_table :visita_gerentes do |t|
      t.references :correntista, null: false, foreign_key: true
      t.boolean :confirmado

      t.timestamps
    end
  end
end

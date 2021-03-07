class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string :txNomeParlamentar
      t.integer :ideCadastro
      t.string :nuCarteiraParlamentar
      t.string :cpf
      t.string :sgUF, limit: 2
      t.string :sgPartido, limit: 255
      
      t.timestamps
    end
  end
end

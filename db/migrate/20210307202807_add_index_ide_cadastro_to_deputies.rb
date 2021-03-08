class AddIndexIdeCadastroToDeputies < ActiveRecord::Migration[6.0]
  def change
    change_table :deputies do |t|
      t.index :ideCadastro
    end
  end
end

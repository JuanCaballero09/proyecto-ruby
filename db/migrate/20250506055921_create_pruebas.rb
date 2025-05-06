class CreatePruebas < ActiveRecord::Migration[8.0]
  def change
    create_table :pruebas do |t|
      t.string :nombre
      t.string :password

      t.timestamps
    end
  end
end
